Return-Path: <florian.boor@kernelconcepts.de>
Received: from mail.kernelconcepts.de (mail.kernelconcepts.de [212.60.202.196])
	by mail.openembedded.org (Postfix) with ESMTP id C0CBF65C9D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 12:35:57 +0000 (UTC)
Received: from [192.168.2.134] by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1YIchu-0001SC-Bg; Tue, 03 Feb 2015 13:35:54 +0100
Message-ID: <54D0C0B1.1090500@kernelconcepts.de>
Date: Tue, 03 Feb 2015 13:36:01 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1422873041-19803-1-git-send-email-florian.boor@kernelconcepts.de>
	<CAP9ODKrSVAaspV7pv+s-eVuhjf3ptFuO-+qc+johEYQbpGaPFg@mail.gmail.com>
In-Reply-To: <CAP9ODKrSVAaspV7pv+s-eVuhjf3ptFuO-+qc+johEYQbpGaPFg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Use bb.warn instead of bb.error for deprecation notification.
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
X-List-Received-Date: Tue, 03 Feb 2015 12:36:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi all,

On 03.02.2015 13:04, Otavio Salvador wrote:
> The PRINC support has been dropped so it indeed has to raise an error.
> The layer you are using needs to be fixed instead.

well, in this case the patch is wrong but we *must* raise a fatal error.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en

