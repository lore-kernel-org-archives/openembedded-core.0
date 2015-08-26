Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 11BD6734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 11:02:12 +0000 (UTC)
Received: by qgeb6 with SMTP id b6so123596890qge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 04:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LxapBjnu6qBkazArkD0DM3vq6JmhkF7sffQ7wIKx6uU=;
	b=U5fYYdPW3kokesqyZPgBIPgmEf/kOCZq15jBuFyDrK7trXmqbhkcWUQfrxy8BLIOxU
	zPZJ8SdOPh6iPaejGlvABl09BUYTTu9z4kz5dQv6WrPDjtZhqrVGKOKqD0NG9yRyFU4u
	/kMdkTQ23E6w/dKHiUZtzRYTsc90se+VYBQl1k09HzbZizXWIie8SSxMrCq2dqZutns0
	fBJCa4cQNtQXNp2yskYQJtA4D2bdpQaXaiMLBoKQuMJEP3eB5NyQkhaZCdR416COAcr6
	Pdo4lHUiIZwd7x5wpSbuc2iXtBjzw51aPwk5tmuAumuMMbOdPY/KKjvnuN6S64BjKFS1
	V7Jw==
X-Gm-Message-State: ALoCoQkviB2DgbbLei7FVt6aZjwuo/PfdsWew4Q0kKKK3eWSpEC0aaJ5aSqHMhpapzuX8RRW+U90
X-Received: by 10.140.133.67 with SMTP id 64mr80618936qhf.52.1440586932741;
	Wed, 26 Aug 2015 04:02:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Wed, 26 Aug 2015 04:01:53 -0700 (PDT)
In-Reply-To: <55DD7C88.4080305@collabora.co.uk>
References: <19f46bb2f6951eca80f159b612b407e3df0b6ea1.1440454290.git.chris_larson@mentor.com>
	<3843d76235f7517207f9aa178d70c731f2b2d51e.1440454290.git.chris_larson@mentor.com>
	<55DD7C88.4080305@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Aug 2015 12:01:53 +0100
Message-ID: <CAJTo0LaO2RSxb_RC-aDUo46dQAoQPwArNJNDCOkkTdEKVUwZhw@mail.gmail.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] insane.bbclass: add host-user-contaminated test
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
X-List-Received-Date: Wed, 26 Aug 2015 11:02:13 -0000
Content-Type: multipart/alternative; boundary=001a1136fdce650525051e34c851

--001a1136fdce650525051e34c851
Content-Type: text/plain; charset=UTF-8

On 26 August 2015 at 09:44, Joshua Lock <joshua.lock@collabora.co.uk> wrote:

> I do all of my builds on a separate partition in a directory hierarchy
> which is owned by my user - if I'm understanding this correctly I'll get QA
> WARNINGS for all of my builds with this change?
>

The paths are prefixed with ${D} so pretend the commit log says "in
packages".

Ross

--001a1136fdce650525051e34c851
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 August 2015 at 09:44, Joshua Lock <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:joshua.lock@collabora.co.uk" target=3D"_blank">joshua.lock@collabora.c=
o.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":n2=
" class=3D"a3s" style=3D"overflow:hidden">I do all of my builds on a separa=
te partition in a directory hierarchy which is owned by my user - if I&#39;=
m understanding this correctly I&#39;ll get QA WARNINGS for all of my build=
s with this change?<br></div></blockquote></div><br>The paths are prefixed =
with ${D} so pretend the commit log says &quot;in packages&quot;.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--001a1136fdce650525051e34c851--
