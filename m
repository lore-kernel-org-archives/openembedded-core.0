Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 36CDC60664
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 22:58:21 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id ta17so3343133obb.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2013 15:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=BadkKbAUHjZWSl4PMkMDJXdjYD+7ODJUE00xjxwdgP8=;
	b=TG4VdLvP4SbZSv5LeiAyQd8tWk/ho5wTpkF6Ox885MOBaWcbuJQhCYz/wyJm0vQk/7
	gpEH8t+NxacJHppD5CHVV9QDZzHyMS9QQnedjM7Aeg6R1OdmsCzjUqU3/vu15HCeVug+
	mAj16Lg1M7ooJyg/LPy2GMzX6fUT47pjfCuUkdeTZQMs3R+T9afO0anpzKgsQbKzTh45
	FYKrIwfHph+A3ROl5uoBiNJiIcxV/VqctbCx6T3UHsJLlJYLrDbfvBRfaqA/l15LKECh
	15hrkgQt+82FCmkJY2w+KeeFXAOszMU87mJyCCZrgnpTgdENCXU7oUa+57GnysU00/Kj
	aqMg==
MIME-Version: 1.0
X-Received: by 10.60.145.241 with SMTP id sx17mr9720452oeb.57.1375570701376;
	Sat, 03 Aug 2013 15:58:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Sat, 3 Aug 2013 15:58:21 -0700 (PDT)
In-Reply-To: <871u6axulg.fsf@parenteses.org>
References: <1375569057-696-1-git-send-email-otavio@ossystems.com.br>
	<871u6axulg.fsf@parenteses.org>
Date: Sat, 3 Aug 2013 19:58:21 -0300
X-Google-Sender-Auth: 9VpVauwmeN-GFYD6JGWDcnE3kuk
Message-ID: <CAP9ODKqL00udxX7ht3JvoFLfOBySCgzebx=eqvoUO_6dcJ1w-Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mario Domenech Goulart <mario@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] blacklist.bbclass: Avoid blacklist specific handle in base.bbclass
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
X-List-Received-Date: Sat, 03 Aug 2013 22:58:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Aug 3, 2013 at 7:44 PM, Mario Domenech Goulart
<mario@ossystems.com.br> wrote:
...
>> +# Cope with PNBLACKLIST flags for multilib case
>> +addhandler blacklist_multilib_eventhandler
>> +blacklist_multilib_eventhandler[eventmask] = "bb.event.ConfigParsed"
>> +python blacklist_multilib_eventhandler() {
>> +    multilibs = e.data.getVar('MULTILIBS', True) or ""
>> +    if not multilibs:
>> +        return
>
> Is the `or ""' part necessary, given that `if not multilibs' would
> branch to return in case multilib is bound to a falsy value?  It looks
> redundant.

You're right. I just sent a v2 removing this code.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

