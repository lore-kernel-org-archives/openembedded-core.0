Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 43CB26FF78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 14:53:42 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id h190so23744262ith.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 07:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Bvyi3IoidyhXPuxO72901Dhioe8OX8VKESbyo+OAe5s=;
	b=M5l4ZjUq/w8UzZ9Rn3Ejk10vWR278l1XCkitaMGkgB7OEGzu5koYYyeUDA7HTs1of2
	jAicI2tgerCkwGJ4rlXBeJNBkBlE7WzhBdPV1QMY/9lxkrMBlZKh3tmJuybePlPK81uW
	yMbUXD7PeWrVaE1p4OzdmfZKGKFB61qYNcO+tsNWeg6UvxKo9cyQAF/KTH+falnZwX3P
	BnYy3AujYhiGjmH2Z+t/k0S7OMEicpRrx7Gvsl9rQ8f1xfi0Rub3ueBW4oIgdcX/S6Pt
	/iBoO/jIjEanlLaOhL/UeWa2WCDAXUcBw9KM52zzdRccarIjGOpvFKsmj0DFZrx66q1C
	trCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Bvyi3IoidyhXPuxO72901Dhioe8OX8VKESbyo+OAe5s=;
	b=J2te/MwqRPU/VFdb73yKnCc4wfD2X68n4F6UFzpy+NVJFOBLY+JSK0lDcA+/Rk/6Rf
	6Bkv8DU1MlkddAFyVqufTTZjlI8oLdS0SrSlEv0yoGRuRQFwZ4JR7rcI03BT8b+41yRd
	8/cAHjO8E8i+HKnY4oJQpbsF7PxGUi+KAUxtnTj6o+ELGKYdZmWwjKTHUEIswkt94SYA
	AbpiCMGwMDP3RkHPbjX50i9RbBE3wAK9bIGjA26l7Z3UiylWGBCv3YWdmcKqi/h6yoJZ
	Xev8x3w+vhUSTC49W2JZWMh0nqTQEURUvveX/NRfSa5ceerDDdurMHikmFywKvt+gTZn
	+7nw==
X-Gm-Message-State: ALyK8tJiPPlvt7xgpI0ptxACG9URTKDb96M86Fe+sRokpEcYlNHEEnprwyR5gMP6vEe6dlVR
X-Received: by 10.36.50.10 with SMTP id j10mr37678720ita.27.1466002423564;
	Wed, 15 Jun 2016 07:53:43 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D2EE.dip0.t-ipconnect.de. [93.232.210.238])
	by smtp.gmail.com with ESMTPSA id
	k101sm12600198ioi.9.2016.06.15.07.53.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jun 2016 07:53:42 -0700 (PDT)
Message-ID: <1466002419.9543.1.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 Jun 2016 16:53:39 +0200
In-Reply-To: <20160615104518.GC2569@jama>
References: <20160615104518.GC2569@jama>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world 2016-06-13
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
X-List-Received-Date: Wed, 15 Jun 2016 14:53:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-06-15 at 12:45 +0200, Martin Jansa wrote:
> libgphoto2, v4l-utils fail because recent upgrade of libjpeg-turbo in oe-core (PNBLACKLIST sent)

I have patches ready for that, will send them now.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




