Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0BB8B74A05
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 14:38:28 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id z4-v6so21917321iof.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2018 07:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eraudFWwav/dBjdGoEUmc6J03JPC6JVbLfeXbhvz+F0=;
	b=EVczqYP1jb7zGLdyegnS+k5hJSB7wZx4v3YyNZ7WT73rppvOKFeq6Ts4oJvxfzHUdt
	KW2QlLvQzM9SCV52At5QW9AEHQkwbNkOanHO8PrbT9ST1cgTqDDYQGZpHzeQ9FQQCMpR
	GqIZeJNt7qz6ySieusyljceEKedz+Loyao7kkr3ObyKLb82wWezE2VEaridofEYBjeF4
	eFyX6fbZCK1OLh0WEtS/ORLQlLBITjB01s0Yo+J0soOrX5aSwEPnZss+gAS/wUil/mHg
	vizFSQPUJkUbwwjGFaBUD8uBAGA77/3liHFwwhKpsk7lSZJJK7+7N36zvYWbDw5+Rs+6
	6BFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eraudFWwav/dBjdGoEUmc6J03JPC6JVbLfeXbhvz+F0=;
	b=b8AsS4ECxw/2HmAXcqwwpZ3WiVl8AikxcZzeiVT+x+EKvYO4+8zXwXoi82EdXUrB9f
	RAPXuETqFahjeg23XtfRU3222/hnXWG165i9l8xw1Y5avswgQgcxJvBQAsoGMwTTjybW
	hIrDyyZzP+UumYWAcudftfHCbNaCiCUbsTPOrnT/BqRRBG9VqLPkjWfTGZQ2becBxdfl
	WSyY/di2En8kvTepbkE1lcyZjYctjjIlcemLzHWe2EzJKalptYF2YUmm0M2QPJ6D5f4v
	Me9h9/KDVyl00n1KAJm/xNVHvehZrdd7XdI1jG2mdNQxXvVrZ4C6UIcx55vZnuLmub5h
	U3IA==
X-Gm-Message-State: ALQs6tChpvnypiP+qeZMYUzRaTfs3EoS5wXUWKp4K3uscrh3bfrqD1Md
	Ek2FDTHvzrtkWiZBh0dQWRt2nIH2fCUoWBlsmx+fpw==
X-Google-Smtp-Source: AB8JxZq6iFvDk02P+0Ed1Z2KomQhPFCRCVHwZmR+QbmZ394Pypr2CdfUeWmVClIIfPFI26ONeLIsSNaY/jqSjryKM3Q=
X-Received: by 2002:a6b:752:: with SMTP id
	79-v6mr26106166ioh.216.1525358310016; 
	Thu, 03 May 2018 07:38:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Thu, 3 May 2018 07:38:09 -0700 (PDT)
In-Reply-To: <a1456696a2f7a5f2dcafb9c12c725d05ee38380d.1525337490.git.Qi.Chen@windriver.com>
References: <cover.1525337490.git.Qi.Chen@windriver.com>
	<a1456696a2f7a5f2dcafb9c12c725d05ee38380d.1525337490.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 May 2018 15:38:09 +0100
Message-ID: <CAJTo0Lbb9nLZbh7w_52LQAsiTOHc7DpYwzhLtahdYyHP6XP84A@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] testsdk.bbclass: set PREMIRRORS for kernel to speed up test
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
X-List-Received-Date: Thu, 03 May 2018 14:38:29 -0000
Content-Type: multipart/alternative; boundary="000000000000396b19056b4e2804"

--000000000000396b19056b4e2804
Content-Type: text/plain; charset="UTF-8"

On 3 May 2018 at 09:52, Chen Qi <Qi.Chen@windriver.com> wrote:

> +            f.write('PREMIRRORS_prepend = " git://git.yoctoproject.org/.*
> git://%s/git2/git.yoctoproject.org.BASENAME;protocal=file \\n "\n' %
> test_data.get('DL_DIR'))
>

protocal?

We could turn on BB_GENERATE_SOURCE_MIRRORS by default.  What's the
overhead?

Ross

--000000000000396b19056b4e2804
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 3 May 2018 at 09:52, Chen Qi <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.co=
m</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 f.write(&#39;PREMIRRORS_prepend =3D &quot; git://<a href=3D"http://g=
it.yoctoproject.org/.*" rel=3D"noreferrer" target=3D"_blank">git.yoctoproje=
ct.org/.*</a> git://%s/git2/git.<wbr>yoctoproject.org.BASENAME;<wbr>protoca=
l=3Dfile \\n &quot;\n&#39; % test_data.get(&#39;DL_DIR&#39;))<br></blockquo=
te><div><br></div><div>protocal?=C2=A0</div><div><br></div><div>We could tu=
rn on BB_GENERATE_SOURCE_MIRRORS by default.=C2=A0 What&#39;s the overhead?=
</div><div><br></div><div>Ross</div></div></div></div>

--000000000000396b19056b4e2804--
