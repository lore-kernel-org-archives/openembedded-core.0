Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SSASH-0001bH-F7
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 19:13:37 +0200
Received: by yenm3 with SMTP id m3so507321yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 10:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=aw6ceMHzjNMM4NfqlwZUlpNbMSKi1XgtH+FM0YKDdlo=;
	b=DLlh8bCql1jzr5KEZG4VKzaZ2yrDL03O8NEwYzFaXSF1LFIvzgmHRstdMe5vGcN4UD
	frmGdskRVrcdirJe6D05D7PHv0ElctIDwZJfqy9ODlfmSyqlGr5OJMwMLmBbsu92m96j
	UxeTMzzcGJnijWe5xbm9sSo7QI0Z21JWHRkYAsQD/EZ7a9UtU1w6EriJitDJVD7RmIeZ
	mmm66Y8mdyc1Csr3aPeo0NFWOBBJztOtNI/n713iNbi3dKZYaPLUmB68L3k5/2hIdhgM
	DXwzKyLecyQxfB+tv/B04VqUE8rRXEhyvWRIBGByjpmF+FwItNhrIlQdIRNkx7/3gk/a
	/81w==
MIME-Version: 1.0
Received: by 10.42.150.8 with SMTP id y8mr504649icv.10.1336583023502; Wed, 09
	May 2012 10:03:43 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Wed, 9 May 2012 10:03:43 -0700 (PDT)
In-Reply-To: <1336581863-23833-1-git-send-email-philip@balister.org>
References: <1336581863-23833-1-git-send-email-philip@balister.org>
Date: Wed, 9 May 2012 20:03:43 +0300
Message-ID: <CAF6bG8eNvdXghPDFh7omfan5mYY56SLJyPLM_oqWRD=-xsBPrw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Add option to oe-buildenv-internal script to change bitbake location.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2012 17:13:38 -0000
Content-Type: text/plain; charset=UTF-8

On 9 May 2012 19:44, Philip Balister <philip@balister.org> wrote:
> Having bitbake inside the oe-core is annoying to some people. This commit
> adds a second option to the oe-init-build-env script.
>
> Run like this:
>
> . ./oe-init-build-env ../build ../bitbake
>
> for example. Without the second option, the old behavior is preserved.
>
> Signed-off-by: Philip Balister <philip@balister.org>

 Maybe you should update comment in oe-init-build-env describing
typical use to contain this parameter.


 - ML


