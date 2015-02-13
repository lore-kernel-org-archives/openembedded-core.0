Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4290665C85
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 14:59:29 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id dc16so7263747qab.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 06:59:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gEZ2V+znNv31fsBmBxNpXbXVOS5D/yDakYoN0iC0MVk=;
	b=EPqNDyZxHIuu7ii6Fds72EqOby3d/0192jQzX7QMJaKBetRiwk/tHh3hKwpGLnhSta
	Hq/E3Jtw7AqRw+/CHISXRd1fgYkYfIttJ5ODvp3wqssZSdgT+5aOE7CEYgiDn7q9muxl
	UZpE67YbbIkH8v8BB8kRtoLJTmrkg8zZSnrbvZFfN2mF3su7CSDpaAFEk58C5KREv8YF
	0NkWmN1ymnCEhPEEG51l/0i/ArImY0/H3bHMGHvZo8JLYR5zH+4Yzr0xN+/VUTJuF1Sw
	3iEUrX8sirxsmItGu8q70KJ/HFPAItXaPoQijpbGNcXpYDF4zLMcxQm/XixpzuEvYLqU
	pfFA==
X-Gm-Message-State: ALoCoQkaHwI6kztqJFuWu7SXltreuLbIZhF4OqJs6uoGr5fryJd45497tjoZPG3QDqTn8hMfZAob
X-Received: by 10.140.92.161 with SMTP id b30mr23847988qge.59.1423839570726;
	Fri, 13 Feb 2015 06:59:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 13 Feb 2015 06:59:10 -0800 (PST)
In-Reply-To: <ac1236b9b575849bae2399e6010d0343708f4984.1423732000.git.liezhi.yang@windriver.com>
References: <cover.1423732000.git.liezhi.yang@windriver.com>
	<ac1236b9b575849bae2399e6010d0343708f4984.1423732000.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Feb 2015 14:59:10 +0000
Message-ID: <CAJTo0Lb5xg1Q=Oqme_qWEpoR0Zv93WPhoK+KqogV-EkHDe2MYg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] btrfs-tools: fix for parallel build
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
X-List-Received-Date: Fri, 13 Feb 2015 14:59:30 -0000
Content-Type: multipart/alternative; boundary=001a1139baf0d49d6f050ef97b39

--001a1139baf0d49d6f050ef97b39
Content-Type: text/plain; charset=UTF-8

On 12 February 2015 at 09:07, Robert Yang <liezhi.yang@windriver.com> wrote:

> Fixed:
> mkfs.c:300:46: error: 'BTRFS_BUILD_VERSION' undeclared (first use in this
> function)
>   fprintf(stderr, "mkfs.btrfs, part of %s\n", BTRFS_BUILD_VERSION);
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>

In mut (about to be merged to master) there's a btrfs upgrade, can you
rebase this?

Cheers,
Ross

--001a1139baf0d49d6f050ef97b39
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 February 2015 at 09:07, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"=
mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":hmq"=
 class=3D"a3s" style=3D"overflow:hidden">Fixed:<br>
mkfs.c:300:46: error: &#39;BTRFS_BUILD_VERSION&#39; undeclared (first use i=
n this function)<br>
=C2=A0 fprintf(stderr, &quot;mkfs.btrfs, part of %s\n&quot;, BTRFS_BUILD_VE=
RSION);<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;</div></blockquote></div><br>In mut (abou=
t to be merged to master) there&#39;s a btrfs upgrade, can you rebase this?=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Cheer=
s,</div><div class=3D"gmail_extra">Ross</div></div>

--001a1139baf0d49d6f050ef97b39--
