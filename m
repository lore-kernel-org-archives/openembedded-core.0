Return-Path: <raj.khem@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7ABF66010E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 06:41:10 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id ta17so4699272obb.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Aug 2013 23:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=lLiYeiQo2KPsH6ouGQJ/ED+c4YxcxcXp3frEKbXLoP8=;
	b=ap5LWEwXXtV9RoBX1G3lS+z5SHICf5ec2SITg0XL3fQ34TMz6rIpxdTG8yr5yX5dVc
	b8xHHVRVTEpZjANY4E3HrHl499uGz4Y0mnMzsy1be4tyMZSZ81AgOF0MUxuWkiMwkWjA
	kEagOaCYDitli9sfqOhexjvGqg1ZBNpj+s7PhuTzmM1aQXsRCHLKTyYJyq3UjynChx0O
	V2rqVnSFcG3DaEytwFZeI0EDuEwhKTD1vlor0MEc+DG5ALWhLfroTL5tUbks6Pin5n3H
	dlv2LJZqinNBsuminOrAWztYOD2TOKxeryAY+vfViXC6PWQKB75+lRKGO+/8+2VffULB
	sFYw==
X-Received: by 10.50.61.179 with SMTP id q19mr3518293igr.33.1376894470833;
	Sun, 18 Aug 2013 23:41:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Sun, 18 Aug 2013 23:40:40 -0700 (PDT)
In-Reply-To: <5211B8C4.7070601@mentor.com>
References: <1376674064-14468-1-git-send-email-muhammad_shakeel@mentor.com>
	<CAMKF1srCL2f+Cxb+2xvLY4_+oikJgXtj0vcR3=9h0tbDf1jGSg@mail.gmail.com>
	<5211B8C4.7070601@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 Aug 2013 23:40:40 -0700
Message-ID: <CAMKF1srikv98W6EQ0Jk7_3FbKaPppaG1sBW-=A6YyD-eR-aj+Q@mail.gmail.com>
To: Muhammad Shakeel <muhammad_shakeel@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] [v3] openssh: Add systemd support
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
X-List-Received-Date: Mon, 19 Aug 2013 06:41:11 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 18, 2013 at 11:18 PM, Muhammad Shakeel
<muhammad_shakeel@mentor.com> wrote:
> /usr/sbin/ is being sed'ed with ${sbindir} in do_install_append of the
> respective recipe file. /usr/bin/ and /bin/ is also taken care of.

i see, thats better. however I do see a need to have  a generalized
way of specifying service files and a generic
processing engine which then takes care of it. Otherwise we have the
same code replicated in multiple recipes

