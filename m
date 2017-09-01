Return-Path: <patrick.ohly@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 561D978487
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 06:45:18 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id f127so2641175wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 23:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=xdNI2ud/Iys33jNVOCw1Rfzazh0+pU+ntdQJEP2JuR8=;
	b=mOR8XCBBSoL/aApmIFmfoZ5302ipxvWAL/ojqHO5zGH3E6NESHRGysIZQZ/WqP1m87
	OvctwfRO1KDbGIahIzKDyru5/zwdry3pXlFpOfGnrQOvurBo+tXeYRGaXASIqAmFfGxV
	irvVspcOfsFU3p5Bo4So5/0V3+6AuFObnfSgGi80VIrJI3/LxujhSoNtL2WExPDj7+Ay
	Jg6fVERhCY8R+atGEXxT9KZnIYXzBrYN4Tv2JpqKGZ68sc+20ZXPcD+jFLR5ZG78ipER
	uthGiI3rhJH90nW5TY6nJ6RDEYjuzLzxxYsBprziZCSeiFBLGBG9INHc1J+D8HRInlMg
	cjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=xdNI2ud/Iys33jNVOCw1Rfzazh0+pU+ntdQJEP2JuR8=;
	b=Tob2PDGNVx1TWrwLrx380ul9lqcOtD9Ep0jRbreatmtAFTAb9hIZk0S3EqvMUvej3K
	IlryH5G7d3nyoqhwZ7vi0P2oJD+aod+Wtice1yPsmvHqirvkqPTSJyrK6HGzRdLmlHj5
	vUDl8BXaz4/R+53GBqdK/F9Zk72bsVs3L7vSnAlyIgq6AAMJV3H+uzj25ELNyvn3MTtu
	4CvQNS9Dk6+Ddzp9vZ8eGZiUn0TtOHbFJqRl22N4+iLtmsWEvgf8p+4hoptbZGB720FE
	4qF53COazrRZh5HV2hUc0IINoEFT73cGc0ltCmSarSlpHI6kN53fNX30Yq/OJZbYtTj/
	AgRg==
X-Gm-Message-State: AHPjjUjc/8UMeIeGlOUxgUZpUSUT9sePyi3GyU2PrGD1YPC/XTq3X9rt
	I6PRiYbPWUb8QfXSQIsIgg==
X-Google-Smtp-Source: ADKCNb5Nwi/kxVxH+T+Q0L2TSS0XOm1IVt+NKkMPxwSOvlQPEwx7WVXMdaFT+XLizEVRI+S1yu9WiQ==
X-Received: by 10.28.141.8 with SMTP id p8mr409660wmd.186.1504248319891;
	Thu, 31 Aug 2017 23:45:19 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8CC40.dip0.t-ipconnect.de. [93.232.204.64])
	by smtp.gmail.com with ESMTPSA id z1sm1473386wmz.45.2017.08.31.23.45.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 31 Aug 2017 23:45:18 -0700 (PDT)
Message-ID: <1504248317.12799.44.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing
	List <openembedded-core@lists.openembedded.org>
Date: Fri, 01 Sep 2017 08:45:17 +0200
In-Reply-To: <1504085996.12799.39.camel@intel.com>
References: <20170829204309.16139-1-otavio@ossystems.com.br>
	<1504085996.12799.39.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH v4] initramfs-framework: Change recipe to be allarch
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
X-List-Received-Date: Fri, 01 Sep 2017 06:45:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-08-30 at 11:39 +0200, Patrick Ohly wrote:
> As I said before ("Re: [OE-core] [PATCH v6 1/1] initramfs-framework:
> module to support boot live image" from July 31st), I consider it a
> mistake that support for live boot with all its dependencies was
> added directly to initramfs-framework.bb.
> 
> I was in a hurry at the time and therefore didn't file a bug, but I
> can also do that.

See https://bugzilla.yoctoproject.org/show_bug.cgi?id=12024

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



