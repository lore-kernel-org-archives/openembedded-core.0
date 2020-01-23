Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 471547F823
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 14:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id F1CD69C00B9;
	Thu, 23 Jan 2020 09:59:06 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id ko2iEKFyPxDD; Thu, 23 Jan 2020 09:59:06 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 62AD79C0293;
	Thu, 23 Jan 2020 09:59:06 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id OuafxlSXwTLK; Thu, 23 Jan 2020 09:59:06 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 468F19C01F8;
	Thu, 23 Jan 2020 09:59:06 -0500 (EST)
Date: Thu, 23 Jan 2020 09:59:06 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <1908740460.2169186.1579791546237.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <b1cbeea067af1e54e596425c87b55b36062bb49f.camel@linuxfoundation.org>
References: <670208445.2165783.1579785268358.JavaMail.zimbra@savoirfairelinux.com>
	<fc798fd12d4a06537fd235b6247a0193d1df3022.camel@linuxfoundation.org>
	<555772143.2167690.1579789341772.JavaMail.zimbra@savoirfairelinux.com>
	<b1cbeea067af1e54e596425c87b55b36062bb49f.camel@linuxfoundation.org>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - GC79 (Linux)/8.8.11_GA_3737)
Thread-Topic: Connectivity check uris
Thread-Index: hAqUwrBZuQVsVfc5vBwIzKc5hkB+wA==
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Connectivity check uris
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
X-List-Received-Date: Thu, 23 Jan 2020 14:59:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Jan 23, 2020, at 3:37 PM, Richard Purdie richard.purdie@linuxfoundation.org wrote:
> On Thu, 2020-01-23 at 09:22 -0500, Jean-Marie LEMETAYER wrote:
>> I understand the issue with blocked domains this is why I suggest the
>> custom domain "connectivitycheck.openembedded.org".
>> 
>> But I dont know if it could be an option. Can OE have a sub-domain
>> like that? maybe using some cdn to handle the load?
> 
> We can certainly setup domains but we can't easily get a cdn. I'd be
> worried about OE's response time too.
> 
>> Another option will be to provide multiple URIs:
>>     CONNECTIVITY_CHECK_URIS ?= " \
>>         https://google.com \
>>         https://www.bing.com \
>>         https://www.baidu.com \
>>     "
> 
> Looking at the code, I wonder if a CONNECTIVITY_CHECK_MIRRORS, injected
> into MIRRORS internally with google as the default and baidu as the
> mirror would work?

It should work but it will not be efficient as the tries are serially executed.
So someone in China should have to wait that the former domains failed
to be able to start the build.

I am still thinking that the OE subdomain with CDN could be the best option.

Regards,
Jean-Marie

