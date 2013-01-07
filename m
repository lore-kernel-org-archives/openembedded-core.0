Received: from mail-ob0-f172.google.com ([209.85.214.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TsHDW-00049v-Ra
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 19:14:37 +0100
Received: by mail-ob0-f172.google.com with SMTP id za17so17814394obc.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 09:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Zjyv/+h0f16oA2o3Dnm2ygYEncs1qAYHTLRYTjRGZVI=;
	b=ATYNxgFPkpaQvwTuetXxoq5XGrQy6vRpwKFN+Keb6g++yIBHre13h5c3n9aYBq94BH
	4jb24BTaqXxuCZf7rQVs//V9/2NrXUVwQ0vwgrlDKrucfQ3mZa4NeZkeTxjvBVgV1eAR
	XMO0jibQv8JFFcXmTkjbFWLedxG2uAvhKnDFlEb6y9+4lP+0/LAkKYmmqP9Aesiuqdtf
	G0r/XzqUSXxsUbVCIjOtw2F2kkdM4WRzf5bOenWm4KTNCpZY2D8E8EdL5vy+eiK+Sg4c
	DdZBfpzSoVsIG/QbvCh8R1MqQ76HntnfjmMq40AiyTtTWvAGXZWSoajbu6+mdQMHJxc6
	KIMw==
MIME-Version: 1.0
Received: by 10.182.212.70 with SMTP id ni6mr44285173obc.44.1357581564787;
	Mon, 07 Jan 2013 09:59:24 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Mon, 7 Jan 2013 09:59:24 -0800 (PST)
In-Reply-To: <1357577024-7889-1-git-send-email-eric@eukrea.com>
References: <1357577024-7889-1-git-send-email-eric@eukrea.com>
Date: Mon, 7 Jan 2013 15:59:24 -0200
X-Google-Sender-Auth: kcGEDOX_ROXqEu6cEt-V4cwZ0j0
Message-ID: <CAP9ODKqOsQMrRDtw+uRgCb4Twr60wC+pbjB9m4_MrPrvF15eyg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libnl: fix compilation on hosts without lex
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 18:15:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 7, 2013 at 2:43 PM, Eric B=E9nard <eric@eukrea.com> wrote:
> * libnl's makefiles are calling $(LEX) but only define $(FLEX), thus
> compilation on a host which doesn't have lex fails with :
> | lex --header-file=3Droute/cls/ematch_grammar.h  -o route/cls/ematch_gra=
mmar.c route/cls/ematch_grammar.l
> | make[1]: lex: Command not found
> | make[1]: *** [route/cls/ematch_grammar.c] Error 127
>
> * this patch fix this by setting LEX variable to flex tool
>
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>

I have prepared a patch for this issue but I did patch the Makefile.am
to use $(FLEX) as this is the fix commited in upstream 3.2.17. If you
do not object, I'd like to propose mine patch for review as it is more
in line with upstream fix.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


