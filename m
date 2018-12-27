Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1C12A6C1BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 16:36:28 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id r10so18747127wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 08:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=LS1RNlxMawMDMj99mM9GMw1HWNkO2rsyRHWaPhU/iec=;
	b=JHqBslrjr1nhCOssGZqyu6Du8MsobFqzvI2cP+Q0LZY8tipAdJLObeTxn2bVKbwevv
	Kmq3BTBC0T3xU1Mj+H9IFTnR1+tetnPOpfIcTGFk3ad2JaAChcN7ePxs1ptZOE+rGe7q
	ugnaatkFkWnU2cwtpqLJqmRy2pzrE1tzUJFwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=LS1RNlxMawMDMj99mM9GMw1HWNkO2rsyRHWaPhU/iec=;
	b=t23v/h6e5BSak9Sc1JkWHS4L1HHciqc88anRwmxVjoIFRUTFcfccmA81XxW4fUg2xX
	Fzz7/NlhqduYJP6JdJH9dfG67FQ8x4VqVguM3KoarQKsfq/T545ObmuZYktbzkTA+vOZ
	FYEnLfXoFdfPh4xytzNs/SrHhTfhNH5IhDnZwEjNhKapkcK9g9vlmGukyDFEkb1BKy4O
	THNlIOPDaiiGyOBowvpydcJGN5Ma2DwsWA1GnEZLj5BW2QezTvSoPVX/sPpu7UzKz36f
	B7gdzNtqMf08u0KQMbvBcCI4DaX3AzZ6xaOgfe1QdHWPYe6glUw7t7q0MgdGY87QeMIf
	462Q==
X-Gm-Message-State: AJcUukcq2NXfygJGfn3BXt1mdyIMaoS0ZoJ8sGnu/3ue7jM0P8+yY1u2
	tHvRPj8FfnfI0FVLLHBSJHqiBA==
X-Google-Smtp-Source: ALg8bN4IyEWWedaldNNYMSqM1des58qs1dgPxLdn7449/iXjjI+eKXDepx5r3zhQGq++1g0ft4nUUA==
X-Received: by 2002:adf:9d85:: with SMTP id p5mr21520656wre.41.1545928589571; 
	Thu, 27 Dec 2018 08:36:29 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o16sm34601178wrn.11.2018.12.27.08.36.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 27 Dec 2018 08:36:28 -0800 (PST)
Message-ID: <d7081e176206bbec40ed91e86aa393709ab5e28c.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: sungwon kim <sungwon.pino@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Dec 2018 16:36:28 +0000
In-Reply-To: <CAE7Z+X16BbOzxNBbaWw-B7qdfttuNki+oR7j1S-ebDyYwvo3-g@mail.gmail.com>
References: <CAE7Z+X0fWR4LtY+iCPGqsGX8atqK+W42SL+MCha1jcjtyt-DHg@mail.gmail.com>
	<0b838a187e20329b17029308181b31a99c73c720.camel@linuxfoundation.org>
	<CAE7Z+X16BbOzxNBbaWw-B7qdfttuNki+oR7j1S-ebDyYwvo3-g@mail.gmail.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] gdb-cross-canadian: Add bison-native for gdb-cross-canadian
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
X-List-Received-Date: Thu, 27 Dec 2018 16:36:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-12-28 at 01:18 +0900, sungwon kim wrote:
> To. Richard
> 
> Thank to comment it.
> When I build `bitbake meta-toolchain` at riscv64 architecture.
> when gdb-cross-canadian return the error message can't find `bison`
> 
> > /home/pino/workspace/Opensource/riscv-yocto/build/tmp-
> > glibc/work/x86_64-nativesdk-oesdk-linux/gdb-cross-canadian-
> > riscv64/riscv-r0/git/missing: line 81: bison: command not found
> > WARNING: 'bison' is missing on your system.
> > You should only need it if you modified a '.y' file.
> > You may want to install the GNU Bison package:
> > http://www.gnu.org/software/bison/
> 
> ...
> 
> > Makefile:849: recipe for target 'all' failed
> > make: *** [all] Error 2
> > ERROR: oe_runmake failed
> > WARNING: /home/pino/workspace/Opensource/riscv-yocto/build/tmp-
> > glibc/work/x86_64-nativesdk-oesdk-linux/gdb-cross-canadian-
> > riscv64/riscv-r0/temp/run.do_compile.21026:1 exit 1 from 'exit 1'
> > ERROR: Function failed: do_compile (log file is located at
> > /home/pino/workspace/Opensource/riscv-yocto/build/tmp-
> > glibc/work/x86_64-nativesdk-oesdk-linux/gdb-cross-canadian-
> > riscv64/riscv-r0/temp/log.do_compile.21026)
> 
> To fix this add native-bison at DEPENDS  at gdb-cross-canadian.inc

Are you adding a riscv layer which adds patches to gdb? If so I suspect
this dependency is due to those patches and belongs with them.

Cheers,

Richard


