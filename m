Return-Path: <Fahad_Usman@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8D1C170E5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 07:45:06 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1XMBPu-0000AE-Uc from Fahad_Usman@mentor.com ;
	Tue, 26 Aug 2014 00:43:46 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 26 Aug 2014 00:43:44 -0700
Received: from [137.202.156.82] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Tue, 26 Aug 2014 08:43:43 +0100
Message-ID: <53FC3AAA.7030700@mentor.com>
Date: Tue, 26 Aug 2014 12:43:38 +0500
From: "Usman, Fahad" <Fahad_Usman@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, Christopher Larson <clarson@kergoth.com>
References: <1408983725-45864-1-git-send-email-fahad_usman@mentor.com>
	<20140825171945.GA25050@haswell>
	<CABcZAN=x7u=gF=-NfbBNLUcqvXgzte_CK_52rQGYikaNSXqU_A@mail.gmail.com>
	<20140825175147.GB25050@haswell>
In-Reply-To: <20140825175147.GB25050@haswell>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 26 Aug 2014 07:43:44.0659 (UTC)
	FILETIME=[76A38630:01CFC101]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] logrotate: obey our flags
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
X-List-Received-Date: Tue, 26 Aug 2014 07:45:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/25/2014 10:51 PM, Khem Raj wrote:
>>>> +    LFS= \
>>>> > > >+    OS_NAME='${OS_NAME}' \
>>>> > > >+    \
>>>> > > >+    'CC=${CC}' \
>>> > >
>>> > >hmmm CC may have spaces in it so you might need 'CC="${CC}"' or somesuch
>> >
>> >
>> >Nope, the whole CC=${CC} argument is already quoted, note the single quotes
>> >around it. Those quotes mean the entire CC=${CC} bit ends up in the
>> >appropriate argument for make, so there's no need to quote the value alone.
> What happens inside makefile is what I am concerned
> in case of python, IIRC it passed it but when CC was used it would
> freak out since CC now was a multiword str but then those were not inside makefiles
> if you have verified thats fine here then I am OK.
Just checked the CC do have spaces, and it works fine. I am re-sending 
the patch with the fixed typo.

