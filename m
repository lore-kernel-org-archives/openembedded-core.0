Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5E0C965F0F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 16:46:38 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id m1so1471669oag.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 09:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=hn8MmsUqywSQqm+npgfpZVU2xbNOmul5unk2qDTWsEw=;
	b=NUnCRb8pMZ2TFD+I7hIifdz/xj86hlF+DHqZEXlhnG2hQztm9dyR4828572w7ep1yP
	eGeS03p8brpYpvfHNb/qVZ108mmNw4OSfheN42gBxVYXsXFPlTAgTHCX5fMYHvGsQe0g
	1Jiky4CPPTOds8ep5Xp6MjAmMpNmqrHiH/1YqRqJsFgDQOxVyTPHxHPZNKvtWIB71WY/
	tEIkBjbCPL7MoV1ew/L26aa83E+qQtOdXCcUkaeMRtCNOo5ynymAXnCgqh4Ub/mX8Da6
	FDQPwzY4Lo+3yVASOMwenw7oxH9DQwZ8JnBl3wBAdFWeYZo8eDPni2ZfS51ZptXVSfG1
	M4Mw==
MIME-Version: 1.0
X-Received: by 10.182.121.170 with SMTP id ll10mr81714obb.58.1405097199558;
	Fri, 11 Jul 2014 09:46:39 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.50.135 with HTTP; Fri, 11 Jul 2014 09:46:39 -0700 (PDT)
In-Reply-To: <1405084930.21289.7.camel@ted>
References: <1404936934.15985.48.camel@ted>
	<CAP9ODKpd5-KkRZg7QMbaMS-zn=f6uephJObn3X44RNoEK8y76A@mail.gmail.com>
	<1405067225.15985.89.camel@ted>
	<CAP9ODKrWDP4OR4W3xxuKgCKzW7iqDZo5uc3DBEm43syYP=EA5A@mail.gmail.com>
	<1405084930.21289.7.camel@ted>
Date: Fri, 11 Jul 2014 13:46:39 -0300
X-Google-Sender-Auth: 6Gr7b6JZqQbCVuBgmflcX2P7YDE
Message-ID: <CAP9ODKrwE-vNz=NcZ7pntPiCaqqdVNkMnOiNGy2yTCJnsNxUBA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC 1/3] insane: Split do_package_qa into a separate task (from do_package)
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
X-List-Received-Date: Fri, 11 Jul 2014 16:46:46 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 11, 2014 at 10:22 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2014-07-11 at 09:14 -0300, Otavio Salvador wrote:
...
>> > I would not recommend setting variables in function prepends like this,
>> > its ugly and error prone, as you've just found out.
>>
>> Any suggested better way of to do it?
>
> The anonymous python fragment should be fine, it sets the data at the
> right level, the global recipe level rather than burying it in some
> task.

and in case we need to do it for the packages split from the
do_package_split? Use the hook mechanism?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

