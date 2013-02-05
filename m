Received: from mail-ob0-f172.google.com ([209.85.214.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U2sKY-0006lh-0N
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 00:53:38 +0100
Received: by mail-ob0-f172.google.com with SMTP id tb18so833620obb.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 15:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=O7jsJnPcJOCHubm2Ktl4wipnjL1inTkaKY/fem0DCWw=;
	b=xE8a+P8FaCjmct4O9xOmvu+2fp45x5KbvlD5u+rSC3AwI2M9J1UDeIwe+0HYMNUCIU
	EWT0IsUv+W+Yop0FQGZFCDuEqZ8AHCQszT1VHcD3dwmqwFO2QDxC0ifkDcdoYRII2nNe
	JrW6LaCet5TrbhhZ5Jd3H42HauSN75D+A1huaX5+vcuPlfa2oiFhUJoWq7CrHTMne2ep
	6aET66NcSyuc4rsX2QKd0Ct7URW9dYhsxgV2w7ovzLcK0o0kMwKeuPH2BgTPRGIXiaVR
	r1cUfIHbnr0rRzxQGIXbDdyCMVj4014xoNxwQ4a9/9ywewM8Zad0NVioWZIVjnn/rii/
	65vg==
MIME-Version: 1.0
X-Received: by 10.182.3.163 with SMTP id d3mr19686058obd.27.1360107467277;
	Tue, 05 Feb 2013 15:37:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Tue, 5 Feb 2013 15:37:47 -0800 (PST)
In-Reply-To: <51118232.101@felipetonello.com>
References: <1360090154-26766-1-git-send-email-ftonello@cercacor.com>
	<CAP9ODKr=N93bjwodD_oEKdWVtpQo8DT1CLLCThArFMyNY2M9Bg@mail.gmail.com>
	<51118232.101@felipetonello.com>
Date: Tue, 5 Feb 2013 21:37:47 -0200
X-Google-Sender-Auth: 6kXzge03b64f5S2DjFi2waJLUwo
Message-ID: <CAP9ODKrvXTuAbZKzzG9JrcuoQEAvr0oNF5SWkAyDBTeteM_jtA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Felipe Ferreri Tonello <eu@felipetonello.com>
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: added recipe libconnman-qt
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
X-List-Received-Date: Tue, 05 Feb 2013 23:53:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 5, 2013 at 8:05 PM, Felipe Ferreri Tonello
<eu@felipetonello.com> wrote:
> Hi Otavio,
>
>
> On 02/05/2013 11:35 AM, Otavio Salvador wrote:
>>
>> On Tue, Feb 5, 2013 at 4:49 PM,  <eu@felipetonello.com> wrote:
>>>
>>> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>>>
>>> This recipe provides the Qt library and QML plugins for connman.
>>>
>>> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
>>
>>
>> For now I'd say this recipe should be in meta-oe;
>
>
> I'm just wondering how one recipe, or patch, is considered to be in meta-oe
> or oe-core?

Well, usually things should go to meta-oe except if it is going to be
commonly used or is used to test something in oe-core. For now, as
default sato does not use Qt connman I'd say it might go to meta-oe.

>> another thing,
>> please take a look in qconnman
>> (https://bitbucket.org/devonit/qconnman) as it has been used by us and
>> it had got a lot of fixes lately.
>
>
> I haven't use qconnman. Well, since I'm contributing to the project, I can
> tell that libconnman-qt is pretty decent. It suppose to have close
> relationship with libofono-qt, both part of nemomobile project. Also it has
> a qml plugin support, which we use here.

Nice; you might be interested in take a look in qconnman-ui -
https://github.com/OSSystems/qconnman-ui - which provides a
configuration interface above libqconnman; it shouldn't be hard to
port it to another connman library.

I'll take a look in connman-qt :-)

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


