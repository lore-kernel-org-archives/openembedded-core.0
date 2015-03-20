Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5C27173A7C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 14:54:22 +0000 (UTC)
Received: by ykfc206 with SMTP id c206so43462114ykf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 07:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=8B6V7P2EKnW6+hoM4m7mkK8aSRcfPMYNa9D2HaT1cTY=;
	b=gNT0UsVmXtA3ubegRxoTBJTORujN1k0BEh85jnUyHo8ZMkkT2JschEhAH7r962uAaA
	pdARO1QK+OXOO7CrlJlGE9JoHP5eJ9EQkfmTmQk/rZkJiQbEprkV2TUySszRK2oiPmJl
	w6sk8YxkkIwRTIXQ5IQxy/l+LBKVR5mllBjZfarrfcJ8alh1sJ7QSzsd4LLnj6wluj39
	p7JJN8zGRJJShBSZICuMdwgC53Q4Eg5MMS/CX/KrrvgT9nY3OGSdin4dQQXFZUydY8ej
	ce9Xy+mqTpOESO3RJeWf/fEXEWXfJvJ7S8rqDXH2e9IkSyVQzhcQ2TdYzHZ/TKwOIftE
	rhiA==
MIME-Version: 1.0
X-Received: by 10.236.229.200 with SMTP id h68mr84312442yhq.90.1426863263341; 
	Fri, 20 Mar 2015 07:54:23 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.82 with HTTP; Fri, 20 Mar 2015 07:54:23 -0700 (PDT)
In-Reply-To: <72e05501cdcd7edf186d4aea4914c90fcb346327.1426772606.git.anibal.limon@linux.intel.com>
References: <cover.1426772606.git.anibal.limon@linux.intel.com>
	<72e05501cdcd7edf186d4aea4914c90fcb346327.1426772606.git.anibal.limon@linux.intel.com>
Date: Fri, 20 Mar 2015 11:54:23 -0300
X-Google-Sender-Auth: kDxjCtqseVwIw1cz2ryKs_zMg48
Message-ID: <CAP9ODKprP=VK68oS0k6XmMAvj+BpXZPEyqYwad=52MthZkpi=Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv4 2/2] xserver-nodm-init: Change to vt1 when stop
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
X-List-Received-Date: Fri, 20 Mar 2015 14:54:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2015 at 10:45 AM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> When X is stopped it remains in the same vt that was launched,
> change to vt1 instead to avoid manual vt switch.
>
> [YOCTO #5336]
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>

Now  I like it :) Thanks for doing those changes :)

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

