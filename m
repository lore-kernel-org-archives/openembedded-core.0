Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 568286E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 15:13:47 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so177960942pad.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 07:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=NYmVO8Uy263PEHwujR+k59g6vFEL7Z79SPGSYNNF1Uk=;
	b=wVrdjenSgbmH1JP0TD8FLGi6I8L2ePKxJ4DJx3Yuwnl3CSW9Q/yg81hxOmUIlTyOZH
	ggKaer1lrpHgMUH82m7Zv+GzvKVYqcbilVn4DntXrskHYLDv//DgidpZItsbCKLK7sD2
	7yMT2AKAuDeJzq+WVE/FruewhiN9F1SZcvzACJZYQmwH71dZRQkDziL0OX4wBboHZUDy
	vOdQeuS7x4FsEI4yby3l9fVlvorLJw8u18pB/P0fL9H0ags8Ctb/D8UM4rzVbV8u+CSL
	OYLZnanGLyzytuXx9jiQPt7R6tK3w3hhd3X/Qak3t8NZW+L6UADWUDKSdAWZs6Bt5g9q
	pLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=NYmVO8Uy263PEHwujR+k59g6vFEL7Z79SPGSYNNF1Uk=;
	b=UM4EYyGTaNaqhydMGmsqiekmLZG6J7QMo19+GCuu2WkYCBfpLcaTPnyjorm+I7dF0s
	XOBDdZr/FfYJnP/fktt7MPCTJHunQXnmgg5qAjqT7NUZ7DjICSBlhURGG4Gf+e/P4CLb
	CMRP2iEPn0XQaNHwCZaD/COqbLn56JuuTD+5s0lWs8YlLkxcNk7pSGIKzDci/ioRVLD/
	aadPFgjJ9OpkXNeGvtZNnpO9Cz4kC1Fc107izXaErjpqnP5jCx7Kx2brrXcNbBBUzE6n
	alRrEMYfjx5qkqLdgnwbJ/sGTNZAd2YV19nJ50D7JMgYdG1coR19CozX4TULEChTfyvl
	/k6w==
X-Gm-Message-State: ALoCoQnnUBD2ZgZ7JI/UCXVaiWLCfALG0ncr1kIuJbMjlLmcaigAgG5hlJgUOenKbNL+V1PgxueT
X-Received: by 10.68.189.1 with SMTP id ge1mr54929478pbc.42.1447686827452;
	Mon, 16 Nov 2015 07:13:47 -0800 (PST)
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com.
	[209.85.220.54])
	by smtp.gmail.com with ESMTPSA id tu9sm37529pac.0.2015.11.16.07.13.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 07:13:45 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by padhx2 with SMTP id hx2so177960112pad.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 07:13:45 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.68.203.132 with SMTP id kq4mr55438408pbc.82.1447686825299;
	Mon, 16 Nov 2015 07:13:45 -0800 (PST)
Received: by 10.66.197.129 with HTTP; Mon, 16 Nov 2015 07:13:45 -0800 (PST)
In-Reply-To: <CAJTo0LZ7334nHja8NNE0hDh2X2kfM3s1vtcRtXo_V9L_FnMNDA@mail.gmail.com>
References: <1447673972-31812-1-git-send-email-otavio@ossystems.com.br>
	<1447673972-31812-2-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LZ7334nHja8NNE0hDh2X2kfM3s1vtcRtXo_V9L_FnMNDA@mail.gmail.com>
Date: Mon, 16 Nov 2015 13:13:45 -0200
X-Gmail-Original-Message-ID: <CAP9ODKp0h1T5VeYEoDPChJNJecNqhS+3BKCLBxcnx5p7-LcxEg@mail.gmail.com>
Message-ID: <CAP9ODKp0h1T5VeYEoDPChJNJecNqhS+3BKCLBxcnx5p7-LcxEg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/3] lttng-tools: Upgrade to 2.7 release
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
X-List-Received-Date: Mon, 16 Nov 2015 15:13:47 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 16, 2015 at 12:43 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 16 November 2015 at 11:39, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>>  rename meta/recipes-kernel/lttng/{lttng-tools_2.6.0.bb =>
>> lttng-tools_git.bb} (90%)
>
>
> There are upstream tarballs, is there a good reason this recipe is taken
> from git?

Yes; the upstream keep a Git stable branch with fixes; for example 4.3
kernel has some relevant fixes after 2.7.0 release and all the others
were already using Git. This recipe were misleading as were using Git
but version specific .bb file.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

