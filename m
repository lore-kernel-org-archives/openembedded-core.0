Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 781D36EF71
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 13:38:32 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id k4so22092685qaq.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 05:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=j73IgT+yW+rQYCgvnXbFhmT/YnRnaGFVJiEsBYM2mnU=;
	b=V2rDvbs7OqunFqgRdqsb66nlsQWdua8K+5iscOvoq6E9i61Z1IEszcMfyXf8u/YuTj
	V99Quks0Ar6VQTP98/RYHrpRSMmPo8DP+TDpBao/oMuAeVqKP5qKIHlacpi3E6gnUouY
	Y/N9oMnc5I6yEMoRgGYAgA2wzNO//3GLkMxYUvJD2fCKdQcPnmm8imZHrMFykMzs6PsV
	b0lEX2JJRZtHdi7qE1YOdBxW1Muqo2yMC/Pt/9lSQ4LR6scLPcU5lFCMylyADJpaZicZ
	CRDsaok3XjY1WnNRSb0Q3SdNv/HT2/m5sej0oLG2zXQkDILlSgh5SVm+/Ae4fKWga4O6
	a0Bw==
MIME-Version: 1.0
X-Received: by 10.224.114.141 with SMTP id e13mr34433572qaq.65.1392644312872; 
	Mon, 17 Feb 2014 05:38:32 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.140.100.140 with HTTP; Mon, 17 Feb 2014 05:38:32 -0800 (PST)
In-Reply-To: <1392586858-12205-1-git-send-email-joaohf@gmail.com>
References: <1392586858-12205-1-git-send-email-joaohf@gmail.com>
Date: Mon, 17 Feb 2014 10:38:32 -0300
X-Google-Sender-Auth: SerDygW3v5ZSyHOIaL1psL5-U5I
Message-ID: <CAP9ODKpexMC2MG9d4L56Hn3LJSS-dqdgBw4GDB1y56u-R8AEGg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Jo=E3o_Henrique_Ferreira_de_Freitas?= <joaohf@gmail.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/2] Add task to create kernel config fragments
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
X-List-Received-Date: Mon, 17 Feb 2014 13:38:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Joao,

On Sun, Feb 16, 2014 at 6:40 PM, Jo=E3o Henrique Ferreira de Freitas
<joaohf@gmail.com> wrote:
> Changes in v2:
>    - address Darren
>       - task name, using diffconfig
>       - except on failure
>       - space after ','
>       - printing the path to fragment
>
>    - address RP's comments (import os)
>
> Hi,
>
> These patches add a new task called fragmentconfig which should be used
> when the user need to extract a diff between two kernel config files.
>
> For instance:
>
>   bitbake -c menuconfig linux-yoco
>
>   [do some changes and save]
>
>   bitbake -c fragmentconfig linux-yocto
>
> See the fragment.cfg in $WORKDIR/fragment.cfg
>
> This closes [YOCTO #3862]

I do like the patchset except that his cover letter seems outdate as
the task now is diffconfig. Maybe you could add another task too,
which we use quite often in meta-fsl-arm, savedefconfig. This would
easy people to generate strimmed versions for use.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

