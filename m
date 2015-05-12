Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7EB1673D16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 14:36:56 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so14931655pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 07:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=KH6lyoo6BL+L3A/sUvPjTNWIxLW5Y5D7zDv/RMT7JJU=;
	b=tRGhJD3LSAVxG1SzGxTE4B7OqT+MUutLAWzQqd+zWCjTACtudc1J1YHKsWwb0ZlZH3
	zMAPxKtXgAByqZ30Nf1quW81BpF79oZz9u7kgWAY3MDYqyRxmE3PHIJEbvQNgxCp4CYW
	ZcIOtpcWulv+2s+YPoESPFdm81Qk7do5VuHrA0qEBqIhPlOQps1orjol+3QTsbmTDT5k
	JsjrhYUWCUU+eurKfwsjCv7fBWXdLvtqoEj91adj5ikY2FUIJlU+T21Nc1xuTd75FC6P
	k2WYZx9d9ltplSWPJi0lVi24PUITAE/j2aLP93iJuIbL3Te6XasAzXj/cOsFw9LEBxbv
	UYiA==
MIME-Version: 1.0
X-Received: by 10.68.108.65 with SMTP id hi1mr28542440pbb.129.1431441418333;
	Tue, 12 May 2015 07:36:58 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Tue, 12 May 2015 07:36:58 -0700 (PDT)
In-Reply-To: <1431439420-5500-1-git-send-email-mario@ossystems.com.br>
References: <1431439420-5500-1-git-send-email-mario@ossystems.com.br>
Date: Tue, 12 May 2015 11:36:58 -0300
X-Google-Sender-Auth: HdpbhtMOqtNybTFQIInc7VhIBXk
Message-ID: <CAP9ODKpKk4sxPHPVZFyhzuSzg_yRHwA8ev6SN0mHfgV58C_cBw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mario Domenech Goulart <mario@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] native.bbclass: avoid unintended substring replacement when setting PROVIDES
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
X-List-Received-Date: Tue, 12 May 2015 14:36:58 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 12, 2015 at 11:03 AM, Mario Domenech Goulart
<mario@ossystems.com.br> wrote:
> The way native_virtclass_handler was implemented leaded to
> unintended substring replacements when setting PROVIDES for
> native providers, in case the original PROVIDES value contains
> providees with common substrings.
>
> Here's a practical case where the old behavior was problematic:
> the oracle-jse-jdk-x86-64 recipe provides both virtual/java and
> virtual/javac:
>
> Before:
>
> $ bitbake -e oracle-jse-jdk-x86-64-native | grep ^PROVIDES=
> PROVIDES="oracle-jse-jdk-x86-64-native  virtual/java-native virtual/java-nativec"
>
> After:
>
> $ bitbake -e oracle-jse-jdk-x86-64-native | grep ^PROVIDES=
> PROVIDES="oracle-jse-jdk-x86-64-native virtual/java-native virtual/javac-native"
>
> Change-Id: I8186992dae58e37c2a2364586360ff9b7da9198f
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

