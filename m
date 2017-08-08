Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id B17C06093A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 19:32:34 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id 77so9377122itj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Aug 2017 12:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Tt4n5JOHXM4Lio40YXhfTv7J+HpQc6Q6WwqMg03a1QE=;
	b=tA4whrqKzF3cKrF+JDqaKBRvU7SUFQcnkoJ/37oxXQf993rV07XH3KgRIWVavthBm9
	rkqMTJDqDDwel98t6WTpOC+uz+K6FgkaKXDrD9dAHF4WiQTAPYLReY/SclxJEtNzMyUE
	t8Re5Ry0pfNsyZ26oam+vhe1aMzWYh3wLOmFeTxV9Ogy1WhrnG92eOyI/S2uY5FqDWmj
	H0YFUzdcJ2cygHRsFqAwK8RalIDr1HHOF1iLnvkHvARYapZaL6nbz1C3ukYVl9NNfjU3
	YaCJTbHmcwVSjzotFgzxGhwEcziLw9BZ1MVEN6BSOleoXhjt4D1ROyu5Fm4P9JJZ0iYE
	P1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Tt4n5JOHXM4Lio40YXhfTv7J+HpQc6Q6WwqMg03a1QE=;
	b=Ok6ERCxfI8h/93pOfDtPxhKI9ghRq4gN8yhaVs4QqdNQo0EENnlpI0jyZICF5vuYxn
	sTPFzcEskVF5g1+LmbThSOzxXiFUMA+x5X/Z2aO+SToa6eYQW2uodaH9uXoFr4vaVtJ0
	CeTtMyTPrD8R9YbnudCeZVxj3qGhC4uLerUgB6l8EcbiOsh+s/0T+2C/6Lod8LeqBBwz
	ViooED7CZ2ci0fIuMTxPUDU1Pb8dvQ5IFJb9l0JtvBfTtk+BAofLR0dk4JkE5qSPSECD
	o7EgTDkDo+pP7FZTqbXztQuDfJonzHdVbflFYWakN9YGe9oQio3p/pb0p0RIP5dTyrKG
	j3rA==
X-Gm-Message-State: AIVw113XTYLylsBSXgvEeG2TK4hIZSqmtRmShy87qEmeOBvx8nrx8jQ2
	NyxdiNEcySXyk/UorkS2zJu+iKl5+3A3
X-Received: by 10.36.166.75 with SMTP id r11mr4287374iti.55.1502220755850;
	Tue, 08 Aug 2017 12:32:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Tue, 8 Aug 2017 12:32:15 -0700 (PDT)
In-Reply-To: <20170808014624.9506-1-JPEWhacker@gmail.com>
References: <20170808014624.9506-1-JPEWhacker@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Aug 2017 20:32:15 +0100
Message-ID: <CAJTo0LaVB7h5ycSzGOcQgpLKcPVbByu9KeR7oqZWoF1Ab4KU4g@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] externalsrc: Handle .git not being a directory
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
X-List-Received-Date: Tue, 08 Aug 2017 19:32:34 -0000
Content-Type: multipart/alternative; boundary="f403045fae0486ef7e05564306c8"

--f403045fae0486ef7e05564306c8
Content-Type: text/plain; charset="UTF-8"

On 8 August 2017 at 02:46, Joshua Watt <jpewhacker@gmail.com> wrote:

> +        git_dir = subprocess.check_output(['git', 'rev-parse',
> '--absolute-git-dir'], cwd=s_dir).decode("utf-8").rstrip()
>

Doesn't work with my old git:

bb.data_smart.ExpansionError: Failure expanding variable
do_compile[file-checksums], expression was ${@srctree_hash_files(d)} which
triggered exception FileNotFoundError: [Errno 2] No such file or directory:
'--absolute-git-dir/index'
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

$ git rev-parse --absolute-git-dir
--absolute-git-dir
$ git --version
git version 2.11.0

Ross

--f403045fae0486ef7e05564306c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 8 August 2017 at 02:46, Joshua Watt <span dir=3D"ltr">&=
lt;<a href=3D"mailto:jpewhacker@gmail.com" target=3D"_blank">jpewhacker@gma=
il.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204=
,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 git_dir =3D subpro=
cess.check_output([&#39;git&#39;<wbr>, &#39;rev-parse&#39;, &#39;--absolute=
-git-dir&#39;], cwd=3Ds_dir).decode(&quot;utf-8&quot;).<wbr>rstrip()<br></b=
lockquote><div><br></div><div>Doesn&#39;t work with my old git:</div><div><=
br></div><div>bb.data_smart.ExpansionError: Failure expanding variable do_c=
ompile[file-checksums], expression was ${@srctree_hash_files(d)} which trig=
gered exception FileNotFoundError: [Errno 2] No such file or directory: &#3=
9;--absolute-git-dir/index&#39;</div><div>Summary: There was 1 ERROR messag=
e shown, returning a non-zero exit code.<br></div><div><br></div><div>$ git=
 rev-parse --absolute-git-dir</div><div>--absolute-git-dir</div><div><div>$=
 git --version</div><div>git version 2.11.0</div></div><div><br></div><div>=
Ross</div></div></div></div>

--f403045fae0486ef7e05564306c8--
