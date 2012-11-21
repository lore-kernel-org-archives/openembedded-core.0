Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TbESC-0006Tl-JC
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 18:51:16 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so3428853pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 09:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=YnBrnTtHN7LIX3ad8JvXOpCmRS181EMOKOz4h2+NuuE=;
	b=O9wN8ocfgVYPSF27NKOrhMYH3KopvMRZrdZuuSaVWJVQZMbVI70CQ9aDrz7ZX1xI47
	8nQQ5uJbkbxNl51R3bYTlC3ziDUfnhVQFtE7ESulA42BuVF1zSplqXou+SG8eC4av02l
	cOwgH39H4Q0RLpB6Io/B7n5Zy78QRgvJ4zndytoNZQhMr3OAuq/ruLiPuPiim1G0CGYN
	UHLtZ/pSLLnhaOFOaJ8foXP+uvEEUddGEvzqVO+Mzm+StfabYIgJzBIhFlQbHpfdMs4k
	caaKKi8XZBmKdIPzYO3fQiue2wUpYnfuLLHE+nB6aaakJdc95A2P2OmsPM141eyGbFyd
	zWVQ==
MIME-Version: 1.0
Received: by 10.66.80.194 with SMTP id t2mr19272699pax.43.1353519430774; Wed,
	21 Nov 2012 09:37:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 21 Nov 2012 09:37:10 -0800 (PST)
In-Reply-To: <1353519268.10459.22.camel@ted>
References: <cover.1353490311.git.kai.kang@windriver.com>
	<bbf45c7739e8d08864c771446b487a5169e1f488.1353490311.git.kai.kang@windriver.com>
	<CAP9ODKoae1cD-qkN=VfSpLDRZO=yrcCXyhEmE+5+ZQbjahpU5w@mail.gmail.com>
	<1353519268.10459.22.camel@ted>
Date: Wed, 21 Nov 2012 15:37:10 -0200
X-Google-Sender-Auth: sKJnG4HwYEqDna6D35csBixFGAw
Message-ID: <CAP9ODKp1gmCuvfnowtK2kyPajCOZoAS4b+0ocW0=-eNs1HUK8w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] msmtp: add link to ${libdir}/sendmail
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
X-List-Received-Date: Wed, 21 Nov 2012 17:51:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 21, 2012 at 3:34 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-11-21 at 09:28 -0200, Otavio Salvador wrote:
>> On Wed, Nov 21, 2012 at 7:38 AM, Kang Kai <kai.kang@windriver.com> wrote:
>> > LSB tests check file ${libdir}/sendmail, and the file was created by
>> > package lsbsetup. Because lsbsetup is dropped, create the link in msmtp.
>> >
>> > Signed-off-by: Kang Kai <kai.kang@windriver.com>
>>
>> I think it is wrong. You should to use alternatives for it.
>
> Not necessarily, its not a file conflict problem, it just needs to exist
> at all...

What if I want to use another smtp and still be lsb compliance?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


