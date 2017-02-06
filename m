Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id E8C937199A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 14:56:32 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id s140so57157233qke.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 06:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iYwXXa8rhuBWu++oNgXd29zlOJs9d9r+EH4K1eKSkB0=;
	b=wDOkZSeZTwMnQXziVhoemoKTyV/8YCZf7TDod6j+BKzEG/pd64643wVT5refqQ8SPf
	6cbtaK72rjYVLSuFF+amww2zFG1uCNpaM+DgCxL+UjZ605B2BY298+4yutKSy9Plb2ha
	PIwuzwg7tw5g1i9qIwCeI2/s1PbxEvnxWcnD/Q2jdIzEJ48zRqA/aaVsEUXDrlxo/NEF
	MGI09t6DNftfeHDphvV8eV5GvrgqF/6VtWxs2g8y9FvwwLF1n0E3eR6dUxG4+6D5jgzh
	gHm77cOHHU4cnopvxqTMJMvKYA75Jtxn3ONJuK7miI64PZRLrXb8+HCQOmA0jbCJleRZ
	uKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iYwXXa8rhuBWu++oNgXd29zlOJs9d9r+EH4K1eKSkB0=;
	b=RHgmcfk2l+EOxSRVQbTGVSX4TAUeAPdfImTeoT73L5MGbjKIqxzw1h9bo7sVSB/s9g
	3zda+kOZcb99fccue0XhawUXILzScSuMUGcEXjgX9lNbiiVJLjFuLt+WHJKOrfP5PtE4
	3kkldDROw4nS/Sn2W4/qJVJK5jIvJlkX+bIvSPJdiMq48vYteW4jkxHOf2yKAqw2Q5L5
	OQIa2Aq6fe2neaJKbwVRLu26cjDDRwaBEBWWub1sc390GiPorkZV8Q5DcqHNfco9zk5P
	5iQb5GTFFKM1a1HFcX8ofPhANt6QP8DPAr5e8g97xxbl+OEF0n7f2ccu+URaOQ2hm7I/
	7iFQ==
X-Gm-Message-State: AMke39nqpuw5902mMv9uyLNIqVmXjlx0u/tWSHz+teHDsV6GyI6jsu1GAAx3n2zCxX35xxh9RQS7hj775wRbFJme
X-Received: by 10.55.183.133 with SMTP id h127mr10553607qkf.121.1486392993329; 
	Mon, 06 Feb 2017 06:56:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 6 Feb 2017 06:56:12 -0800 (PST)
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48AC31CBF7@SESTOEX04.enea.se>
References: <3230301C09DEF9499B442BBE162C5E48AC31CBF7@SESTOEX04.enea.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Feb 2017 14:56:12 +0000
Message-ID: <CAJTo0LZ+khtB9f==4KQr_iaVJhHmTGfFj-2toAnN=GFPiyUVDQ@mail.gmail.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Cc: "mariano.lopez@intel.com" <mariano.lopez@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: do_populate_cve_db: Error in executing cve-check-update
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
X-List-Received-Date: Mon, 06 Feb 2017 14:56:34 -0000
Content-Type: multipart/alternative; boundary=94eb2c0600565d46450547ddd67c

--94eb2c0600565d46450547ddd67c
Content-Type: text/plain; charset=UTF-8

On 6 February 2017 at 14:43, Sona Sarmadi <sona.sarmadi@enea.com> wrote:

>     bbdebug 2 "Updating cve-check-tool database located in $cve_dir"
>     if cve-check-update -d "$cve_dir" ; then
>         printf "CVE database was updated on %s UTC\n\n" "$(LANG=C date
> --utc +'%F %T')" > "$cve_file"
>     else
>         bbwarn "Error in executing cve-check-update"
> <<<<<<<<<<<<<<<<<<<<<<<<<
>

This definitely needs to be rewritten so you can see the output if it
fails.  Just run cve-check-update -d <dir> yourself and see what it says.
Last time I had this failing it was because the mitre servers were offline.

Ross

--94eb2c0600565d46450547ddd67c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 February 2017 at 14:43, Sona Sarmadi <span dir=3D"ltr">&lt;<a href=3D"=
mailto:sona.sarmadi@enea.com" target=3D"_blank">sona.sarmadi@enea.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1vq" class=
=3D"a3s aXjCH m15a13e1fae6963e3">=C2=A0 =C2=A0 bbdebug 2 &quot;Updating cve=
-check-tool database located in $cve_dir&quot;<br>
=C2=A0 =C2=A0 if cve-check-update -d &quot;$cve_dir&quot; ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf &quot;CVE database was updated on %s UTC=
\n\n&quot; &quot;$(LANG=3DC date --utc +&#39;%F %T&#39;)&quot; &gt; &quot;$=
cve_file&quot;<br>
=C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;Error in executing cve-check-updat=
e&quot;=C2=A0 &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&=
lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;</div></blockquote></div><br>This de=
finitely needs to be rewritten so you can see the output if it fails.=C2=A0=
 Just run cve-check-update -d &lt;dir&gt; yourself and see what it says.=C2=
=A0 Last time I had this failing it was because the mitre servers were offl=
ine.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--94eb2c0600565d46450547ddd67c--
