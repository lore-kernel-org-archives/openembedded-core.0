Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6316178271
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 14:38:57 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id m47so20295617iti.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 07:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=2Pn5u3O3sPxL+Ivwhx3DhpANJJWGQ/5ohCd+OezSTdk=;
	b=IPMuyc5RWT8q613V0CBlSM3jLdtO6BAsm3GcjJnUIYZ1siOVC49TcH9BQr3LjDbDQ+
	uYj87Tpz6aul1/YRJ09WlvuvIaoBcm6V/PLVzc6i/XrI0Wu9tcSnoznSu3NhjjuSSDBb
	53xBoXxRn548L87Cf0Lp+CgDzUKzUcHFlKz/hplhY2KI6hSWuTixuDkVqltgn9/iLgRQ
	FLKf7hJ6LXCc9N9yuPbAYhajmwbG4FW80LGXepgdfPAdaD2WmWsbLDbHoYFNpd7kKSsg
	AGeDKT5mh7KvQjNcpd+rYwnlNcakoZWBWi7Vp/jn+f6eSRm9LWKnM0C8xudDP9bZ72lp
	/7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=2Pn5u3O3sPxL+Ivwhx3DhpANJJWGQ/5ohCd+OezSTdk=;
	b=Ifiyn93hzj7Ok56ecqzLBoSEiB+rc+JFmSfZp05F1lmzJWOAVyjIT4AS+fbj6ZkAAr
	vYQveTpI7eWZEfYZ0bidt06SN/E36Uq+QQhSPTiWCWtcxrDY+ttoxOnAQd6r2qtR99Vg
	CZfOopx2jaET4mAegOEbmgGSjaTegipfrB/lJyJHwF33DSvwOspi/jBLMu0IF47vyXTM
	bYDUzCDMEQDYSzJLAUsEYCtjHeGgGLmznEouSj+mQI6irv4gqa0cVHZ60TLtwJJUyId8
	IfdCRh447UgtlTau04LhihX0Z2FD9iW67VpOJjzR8eillRDRKOGi2oX/wJg6MRSPneHP
	11gA==
X-Gm-Message-State: AODbwcBZ+7HeKNMHdxusSW7w6o5foLDa3gutm3P+ThOsAksHfVtc8NiD
	ZeZn8pdmeftWKR1e
X-Received: by 10.36.111.139 with SMTP id x133mr5874683itb.25.1496932738938;
	Thu, 08 Jun 2017 07:38:58 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8CE54.dip0.t-ipconnect.de. [93.232.206.84])
	by smtp.gmail.com with ESMTPSA id
	t76sm2473074ita.22.2017.06.08.07.38.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jun 2017 07:38:57 -0700 (PDT)
Message-ID: <1496932734.30163.137.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Thu, 08 Jun 2017 16:38:54 +0200
In-Reply-To: <a0a0eb57632c422ab7ab8fac7654dd80@XBOX02.axis.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<7942e5efccf0ee4fa360948d892b4508e3f1f00c.1496849345.git-series.patrick.ohly@intel.com>
	<13cfc543313a4c59bb8c9688c91db3c4@XBOX02.axis.com>
	<1496901892.30163.119.camel@intel.com>
	<1496918712.6630.237.camel@linuxfoundation.org>
	<a0a0eb57632c422ab7ab8fac7654dd80@XBOX02.axis.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bitbake.conf: DISTRO_FEATURES as overrides
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Jun 2017 14:38:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-06-08 at 13:16 +0000, Peter Kjellerstedt wrote:
> > My feelings are:
> > 
> > * We need to use a prefix. We've been burnt too many times in the past
> >   when not using these. "df-" is fine, users will just have to deal
> >   with it.

Fine with me.

> > * We should filter the list of overrides to those which the distro
> >   wants to nominate. I really don't want to encourage wider spread of
> >   things than we need to, these need to be conscious decisions.
> 
> Isn't there a risk that will be confusing? I.e., recipes that use, e.g., 
> bb.utils.contains() to check if a distro feature is set will be affected 
> as soon as the feature is added to DISTRO_FEATURES, but recipes that 
> use the override will only be affected if the feature has also been 
> added to some filter variable.

I'm not sure. I guess it boils down to proper documentation.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




