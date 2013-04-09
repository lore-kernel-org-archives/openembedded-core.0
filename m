Received: from mail-ob0-f174.google.com ([209.85.214.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPcH2-000422-Qx
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 19:24:04 +0200
Received: by mail-ob0-f174.google.com with SMTP id wm15so4563057obc.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 10:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=flxiZSSykuTrZrhcNjuk8EZWj8HvgOraj9KswzouIUI=;
	b=NU9etLhXOkKVLv3bU70wSISotFDlvO2sEB+DmtxwrxZcKv5YKLUdflAt6451FmPeGT
	1uqsHif7gOC7Bbx3Tg2Rw79QOlZcEHjimNP2hugh7AZGjIDtb2Cc5iRDrixjS6wiuBlj
	I1pefffApi3t3+3wPWGeA0HNSx6E6qK8DdeLcI8h+u9/bsRHQ7LW0bOM53U6O9wDv934
	bEVaO+rPjZFdvpWyaXJP3MGL/sEiEshfyKKh94U147+KRnaWcOL+hDk1azlQqQ/lZl/i
	WmpSkS8CeZIzmU7APybRDei/P1N1/x5m983g2H5C2GKuOY7MAdqOl4frt5++jyCWWQU4
	9QEg==
MIME-Version: 1.0
X-Received: by 10.182.125.132 with SMTP id mq4mr7428699obb.79.1365527199790;
	Tue, 09 Apr 2013 10:06:39 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Tue, 9 Apr 2013 10:06:39 -0700 (PDT)
In-Reply-To: <CAJTo0LZOu21EYan2-wa3HSVfYM=rriTPozn+fdb4Xme=bABFVw@mail.gmail.com>
References: <1365523730-15141-1-git-send-email-sgw@linux.intel.com>
	<CAP9ODKpdu79HJPSA7a9-q_XXP1YffeXNq6g9c=ts4ktvMJfJhA@mail.gmail.com>
	<CAJTo0LZOu21EYan2-wa3HSVfYM=rriTPozn+fdb4Xme=bABFVw@mail.gmail.com>
Date: Tue, 9 Apr 2013 14:06:39 -0300
X-Google-Sender-Auth: ZjimAjeTFkXZaxlfQ_glSifbn24
Message-ID: <CAP9ODKotVnJyN8RyJCG6-LukhA3jkkrc0DPgq2VVfMVC66Yj5Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: fix init script for the location of udevd
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
X-List-Received-Date: Tue, 09 Apr 2013 17:24:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 9, 2013 at 2:00 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 9 April 2013 17:33, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> On Tue, Apr 9, 2013 at 1:08 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>> Ensure we can update the script base don the location of the udevd installation
>>>
>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>
>> This does not work as we have systemd-udevd as possible binary.
>
> But these changes are in the "udev" package, so will only be used on
> systems which are booting udev.
>
> Related, all of the changes happening to udev need to happen to systemd aswell.

The init-live problem people are concerned about is not fixed for
systemd-udevd as well.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


