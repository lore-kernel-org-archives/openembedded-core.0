Return-Path: <florian.boor@kernelconcepts.de>
Received: from mail.kernelconcepts.de (mail.kernelconcepts.de [212.60.202.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5EE576017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 14:41:51 +0000 (UTC)
Received: from [192.168.2.34] by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1YTtRn-0001Oi-EH
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Mar 2015 15:41:51 +0100
Message-ID: <54F9BC93.6060102@kernelconcepts.de>
Date: Fri, 06 Mar 2015 15:41:23 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
CC: OE-core <openembedded-core@lists.openembedded.org>
References: <1425408376-16981-1-git-send-email-florian.boor@kernelconcepts.de>
	<CAJTo0LZL=jaHMLP-txpcDFWbpi_c4R3xWJQ0dk51mbF7ZdaWgQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZL=jaHMLP-txpcDFWbpi_c4R3xWJQ0dk51mbF7ZdaWgQ@mail.gmail.com>
Subject: Re: [PATCH] directfb: Allow native builds of directfb 1.7.6
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
X-List-Received-Date: Fri, 06 Mar 2015 14:41:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Ross,

On 06.03.2015 12:46, Burton, Ross wrote:
> Presumably you have patches to enable those for native, or would it be best to
> disable them in the native case as presumably all you need are the tools?

you are right, I have these as well but I used bbappend to get native support
for these. I will take a look for the easiest solution and create a patch.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en

