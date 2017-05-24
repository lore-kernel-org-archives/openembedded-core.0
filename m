Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id E2228719E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 20:15:31 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id y201so162986556qka.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 13:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KNu4Q7LX0VeCV+/EtxKJO7ORiLPe5BRmsn072jbNj1U=;
	b=MLohzTWOm5FtOHzXyk4ZU/NcOHAHbP2YwG6KZpCvKQgcudmsRB4ffVEXRSpOtk9/Si
	zzT5wB3MfzwaGMS9/GC7p/FO8yaGvagQ/hzkrYPQ9PM9hnxs9tql1dETTX+ksIV6SI01
	06WJ2TzJ6cQa3dZbVbC3Os3HhYUjoLW4PUA4xShcV8JW3qm21AIj040AGRJYDqQ1dFsz
	k71wrpem664PL9VAkev8fP+K97VAHNAkfLK5UuOf9YVUf9D8UeNiZN6NxU9JLrYhWGLs
	pq7prjL+lTxP6fGZWp+pT0vS7N+8hiD6MBVzDz9sIyiZikUfYbU6btrVakIY8BI5FO+2
	T+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KNu4Q7LX0VeCV+/EtxKJO7ORiLPe5BRmsn072jbNj1U=;
	b=LXu8CbB5FOEBWdU7LJpsqk92Wze+cg7OiOB+bu1Dv6dbrfwbf0nxL9xrw192XNhoyq
	H+LsdAUXfQltc5cHn5JPCqHXiix2nXNCg5AZ0U4i/9hC1G2SzToFkDcn7Drlby5jNyK/
	MdhZSaR49TvyildcfW7yqxG0D3u9MprFZ713cP4L3srd8AybQs/lcka7IuhYm2PQngAJ
	5LxlxEo96pOvby/eWL+tewMCmMB3PNPqn0Fsaom50Oz9nCmb+UX//TVhCmuckVduC8UM
	gfsdNoxbzmlqeJBrtrDkgJe1iLVDuR7kZWqSv2nzdjoqrJE8rcH3B6KgU2oBxlL77Rrs
	cZow==
X-Gm-Message-State: AODbwcBcZYE+4jh0BFDwENZRlXbXZXavlVJkoepMlNceqqjH2+eRziPI
	7SDZ8NNq1qZBrQzNgSDrAPWPycmkrOAO
X-Received: by 10.55.116.133 with SMTP id p127mr30955234qkc.154.1495656932842; 
	Wed, 24 May 2017 13:15:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Wed, 24 May 2017 13:15:12 -0700 (PDT)
In-Reply-To: <20170522164309.31121-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170503192603.41086-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20170522164309.31121-1-leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 May 2017 21:15:12 +0100
Message-ID: <CAJTo0LaJrNTwML2jQbPR+p5y3EOnwm=D2nDiD5VcHtfer8m+gA@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] package_ipk: correct ipk descriptions
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
X-List-Received-Date: Wed, 24 May 2017 20:15:32 -0000
Content-Type: multipart/alternative; boundary="001a114fde7230557005504ac4f2"

--001a114fde7230557005504ac4f2
Content-Type: text/plain; charset="UTF-8"

On 22 May 2017 at 17:43, <leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> Empty descriptions are set with a space following by a dot. For the
> non-empty ones,
> there is no need for formating the description with textwrap, so remove
> the logic
> for the latter.
>

Looks like opkg doesn't behave like this as building lzop fails (which has
lots of newlines embedded in the SUMMARY).

Ross

--001a114fde7230557005504ac4f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 May 2017 at 17:43,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leonardo.=
sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandoval.gonz=
alez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div id=3D":142" class=3D"a3s aXjCH m15c310b3aa6d7e0c">Empty descriptions=
 are set with a space following by a dot. For the non-empty ones,<br>
there is no need for formating the description with textwrap, so remove the=
 logic<br>
for the latter.<br></div></blockquote></div><br>Looks like opkg doesn&#39;t=
 behave like this as building lzop fails (which has lots of newlines embedd=
ed in the SUMMARY).</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--001a114fde7230557005504ac4f2--
