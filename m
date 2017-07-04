Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7962977E4A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 13:49:40 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k67so47271319wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jul 2017 06:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=KQMUmmAH5YF3LxWLc00WBAFS3Kro+8qV9mY4aP4t0ZU=;
	b=tHdwzb66sNqH/a+Y7CYM5OU4kFjy58rgCzFDdCw64x0kuWTwVS1oV+yI6n138MoxZA
	rW+H8J1+D7ThIeG5z13LwDtMNixOV5VQ3PVPL7HEdDSFmRKsmFc17jk0pJ2YX9NHhQ6M
	QoScb2VwOkJc1sBlSgiBdBxIZAXFmtTXguHPdN2i9DZT8y8eXnI9uQhQ0mYtm6eFIyX3
	bQtJmfOaYaEzKabMM1sqbCtlAoMxpKTuw6Ixelx6LI4iwtkIy0FeGRmDYVZyAOqMa6bl
	J3l4jbgtdqCyvZ6aF4kMJZnqLuJNkmY0t8wlpT4omqYnCy8q8IuFBzfy/Tl2tuMiQEgw
	4V+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=KQMUmmAH5YF3LxWLc00WBAFS3Kro+8qV9mY4aP4t0ZU=;
	b=ghJ3P7p3xdov5p56I9j+uJtP7BE5vn2tX0iASLGccCLjVo/zXl8cPO5aMmsSE+/c6e
	5cGWUZzTcoBEFr4e49VHEKpojx6EF72Q48/8es9aHJ/+QvFSaoAMSOR4vA1Wlk4uKz8C
	42qNaE3ghrEGiIjH8rllO/ULBdOetme4yGkrfsrIGoK5I6rwbiZgxBp5Zw5mqOvKjZXt
	+ImIR4sqztP6dEarsUt5fG5frM5JRpF+CdKI54FxSW5BqmjVy1b0HXAX6+RNWc1vY+I1
	F+mEzH+VLJHhOrEekcHxE3B08vhdGwBd795Z+ePubFqAz6wvMIwfaaL0+VrVeysdXp3N
	ePBA==
X-Gm-Message-State: AKS2vOy9iffGLVBkXBrx+plmte2wDM1wTmAxbvKx+LJLExwuww4uSJjo
	Eg/hOrooBL5tIYIRjZA=
X-Received: by 10.223.150.89 with SMTP id c25mr34347834wra.15.1499176180951;
	Tue, 04 Jul 2017 06:49:40 -0700 (PDT)
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com.
	[209.85.128.174]) by smtp.gmail.com with ESMTPSA id
	l20sm14457151wre.25.2017.07.04.06.49.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jul 2017 06:49:40 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f174.google.com with SMTP id r103so249581198wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jul 2017 06:49:39 -0700 (PDT)
X-Received: by 10.223.138.252 with SMTP id z57mr39909623wrz.66.1499176179495; 
	Tue, 04 Jul 2017 06:49:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.209.14 with HTTP; Tue, 4 Jul 2017 06:49:38 -0700 (PDT)
In-Reply-To: <CBAEED2EB06BF94889E80B47A33FE329ED6B5E@PGSMSX105.gar.corp.intel.com>
References: <cover.1498782014.git.wei.tee.ng@intel.com>
	<340dcd3ae5be23d6f1395d4f8bb6fd25f7a95c6e.1498782014.git.wei.tee.ng@intel.com>
	<CAP9ODKoZ48A6Qp1TEvvt2mwE-LEvArjTEQim=FHE9ksvCG1U2w@mail.gmail.com>
	<CBAEED2EB06BF94889E80B47A33FE329ED6B5E@PGSMSX105.gar.corp.intel.com>
Date: Tue, 4 Jul 2017 10:49:38 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo2hNUgt1VioyhK6Y=s-qp+bcXH1R17hWzG6yGEkUY67w@mail.gmail.com>
Message-ID: <CAP9ODKo2hNUgt1VioyhK6Y=s-qp+bcXH1R17hWzG6yGEkUY67w@mail.gmail.com>
To: "Ng, Wei Tee" <wei.tee.ng@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] initramfs-framework: udev: Add a runtime dependency on udev-extraconf
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
X-List-Received-Date: Tue, 04 Jul 2017 13:49:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 3, 2017 at 10:11 PM, Ng, Wei Tee <wei.tee.ng@intel.com> wrote:
> Yes, it's mainly to support the live boot image. Therefore the udev-extraconf is being added in the rdepends.
> The wrong that you mentioned is because of the commit message was not convey in the correct way?
> The initramfs-framework currently is not handling live boot support. Perhaps, "In order to implement initramfs-framework for live boot support" will be better?

Move it to live-boot package rdepends.

I don't want automount when adding udev only it seems wrong.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

