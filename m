Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 76B166E908
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 19:07:36 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id uy17so7758133igb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 11:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ROeiyuPhl9yRvb0vlXv0aR5cIKyNazbwVwF45K8iZc8=;
	b=Ss0Bk9AS1NuAQ+xMzIf1kPS4cmBA5XhIyL6pYGe89WyU4t7rK4IVNSTCi2gXTVi3yS
	wFhgz6sTxPYYdbR0pS3VWIw0QRJs+RJtogrhKLaW6CYkTrbhnhCUJ954NPQpXBtkmX/i
	QmKQgziBVCgXEQ1CxCvTmwXOwjLGZMtV6J2FNiN2C9IFsCsYlty46sNFqQWBzdNOBVMo
	l7R9RWyt6+xU1fepQTKRbtFZVOIMmewAJCBrOVYaTfE4hsPXgLDhmGWp2z73XvJjILH2
	BPrn4Nw4/xnsbByBsSUPlS6z5RSJFYeHtlwwbznQGmyjDLYxdRtlQ/yEOFyudCxhEgYP
	EYyA==
X-Received: by 10.42.176.195 with SMTP id bf3mr15631525icb.25.1392750457312;
	Tue, 18 Feb 2014 11:07:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Tue, 18 Feb 2014 11:07:07 -0800 (PST)
In-Reply-To: <CAMCfZKGFs8-AEyFx4PCCu-t5c_fOLHi4ceJD+txO3woO4Mb0ZQ@mail.gmail.com>
References: <1392745755-20315-1-git-send-email-diego.sueiro@gmail.com>
	<CAMKF1srUcG1euTY2kzKroG5k5h7R-nUd7aFhqk2dVvcu-k8BrA@mail.gmail.com>
	<CAMCfZKGFs8-AEyFx4PCCu-t5c_fOLHi4ceJD+txO3woO4Mb0ZQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Feb 2014 11:07:07 -0800
Message-ID: <CAMKF1sr-cAni3FXQHMmiEY_tapzPVfcY2h6DGPTZ-zY5F7+Rjw@mail.gmail.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] packagegroup-qt-toolchain-target.inc: add libQtUiTools static library
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
X-List-Received-Date: Tue, 18 Feb 2014 19:07:37 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 18, 2014 at 10:55 AM, Diego Sueiro <diego.sueiro@gmail.com> wrote:
> Khem,
>
> On Tue, Feb 18, 2014 at 2:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> can you also figure out what is the licensing terms of these static .a
>> archives please ?
>> and make a note of it in commit message or somewhere
>
> Looking at the main library header (tools/designer/src/uitools/quiloader.h)
> it mentions the Digia Commercial License, LGPL v2.1, LGPL Exception and
> GPLv3.

what would be the license of this given library is it all of above or
some combination
or choice ?

>
> I think it is not different from the other libraries and if you use this
> library (in this case static library) in LGPL or GPL you should provide your
> source code and follow the same license. Am I wrong?

static linking and dynamic linking has different implications,

>
> Regards,
>
> --
> *dS
> Diego Sueiro
>
> Administrador do Embarcados
> www.embarcados.com.br
>
> /*long live rock 'n roll*/

