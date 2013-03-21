Received: from mail-oa0-f50.google.com ([209.85.219.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UIhho-0005Nv-7z
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 16:47:06 +0100
Received: by mail-oa0-f50.google.com with SMTP id n1so418219oag.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2013 08:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=sO71l411YBL8LuC6dwFBKbEELGcX7yI/a8csMxpl3Vk=;
	b=on8M4qqD9XndaXlfFRd/Segxihy+7/FSHf39CsQ76FSR5FFj7eFifcxlQ/GHRAe3aG
	yafp3D2jxv0L0H1/wP0eCKBtdCTotZFhTHp3g14eFtK5cJDFMTSX+A1pzQQsa4CZ23Ib
	IYkiSFIqJfw2T8LAtnpNjgO4/HT+y1PjMEwGmRAsRif9gfQpA4Bqa/uzXh7AB8zIdon+
	pB6+FKnnLxWtsOIm7YaX6C1yBkK/C7rgrjKCxjer5+nis9X1QFSzQAA0gl+p0deoUYjr
	WZMT9GpuWpvbR+xFsY6p3eewgiWUiTzqiXBB9fGZV7nmyPJxKX7ghvJO7sAdegxs3g/3
	1icw==
MIME-Version: 1.0
X-Received: by 10.182.231.39 with SMTP id td7mr7120022obc.86.1363879811218;
	Thu, 21 Mar 2013 08:30:11 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Thu, 21 Mar 2013 08:30:11 -0700 (PDT)
In-Reply-To: <3527746.ix60sDuch3@helios>
References: <1363816904-14989-1-git-send-email-otavio@ossystems.com.br>
	<3527746.ix60sDuch3@helios>
Date: Thu, 21 Mar 2013 12:30:11 -0300
X-Google-Sender-Auth: _srzth4z-mWxyCAQ3xq4ooLoZaM
Message-ID: <CAP9ODKrXhniEb+aExauc_OHMXH-fGHugzmdYFKTtO7=wxLSq_A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-firmware: Package boardcom firmwares
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
X-List-Received-Date: Thu, 21 Mar 2013 15:47:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 20, 2013 at 7:31 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 20 March 2013 19:01:44 Otavio Salvador wrote:
>> Adds specific packages for bcm4329, bcm4330 and bcm4334, including
>> handling of symbolic link for the needed firmware filename.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> s/boardcom/Broadcom/

Yes; will send a v2 today.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


