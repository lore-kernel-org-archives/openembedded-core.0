Received: from mail-oa0-f45.google.com ([209.85.219.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1U2qsY-0001hD-RC
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 23:20:40 +0100
Received: by mail-oa0-f45.google.com with SMTP id o6so781795oag.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 14:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=OD4GWcUejK6H+z4mU0HnLgwhPORELqgcteWZlDD8Ous=;
	b=E0QJfY6lMW8BvlsLxyFp/xrL530T03Uy04n2i3wLnvWHbor81MSZtq0gNwrf7d6zM0
	qiylLzgc1f6jixC58Ffqs4tySGq64FKnDLeYYqZEyy2TceeSVUz+RwHyd6o0PiEWq7+M
	VfO/5apQVT1qHNop6N9jqPMNkIx2tWYxIbHiF/evPQoynnNNZCDJmHdfLwi8mvidJgMa
	umvO3QQrsglF96SgN7fK8ZLCgQ2lMjzFAzGTDOeycLD37KDijkL6OgTicEnETQCpFBfm
	UsAGJS0xHpuIiTjFXCosR75K25JUTwg6N8znTQ5tlJjtlqg1H/9uzD4uE+ngGvsC5GAw
	0h0w==
X-Received: by 10.60.30.38 with SMTP id p6mr20658546oeh.2.1360101888209;
	Tue, 05 Feb 2013 14:04:48 -0800 (PST)
Received: from [192.168.48.44] (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPS id w10sm27294592oeg.2.2013.02.05.14.04.46
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 14:04:47 -0800 (PST)
Message-ID: <51118232.101@felipetonello.com>
Date: Tue, 05 Feb 2013 14:05:38 -0800
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1360090154-26766-1-git-send-email-ftonello@cercacor.com>
	<CAP9ODKr=N93bjwodD_oEKdWVtpQo8DT1CLLCThArFMyNY2M9Bg@mail.gmail.com>
In-Reply-To: <CAP9ODKr=N93bjwodD_oEKdWVtpQo8DT1CLLCThArFMyNY2M9Bg@mail.gmail.com>
X-Gm-Message-State: ALoCoQkdKC7m1jU1MBast+Y0wRkfSSEVNuEEKZOGrTK2J7II5rJMwTEA6g1AYDLTC/9ohPe13vZk
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
X-List-Received-Date: Tue, 05 Feb 2013 22:20:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Otavio,

On 02/05/2013 11:35 AM, Otavio Salvador wrote:
> On Tue, Feb 5, 2013 at 4:49 PM,  <eu@felipetonello.com> wrote:
>> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>>
>> This recipe provides the Qt library and QML plugins for connman.
>>
>> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
>
> For now I'd say this recipe should be in meta-oe;

I'm just wondering how one recipe, or patch, is considered to be in 
meta-oe or oe-core?

> another thing,
> please take a look in qconnman
> (https://bitbucket.org/devonit/qconnman) as it has been used by us and
> it had got a lot of fixes lately.

I haven't use qconnman. Well, since I'm contributing to the project, I 
can tell that libconnman-qt is pretty decent. It suppose to have close 
relationship with libofono-qt, both part of nemomobile project. Also it 
has a qml plugin support, which we use here.

Regards,

Felipe Tonello


