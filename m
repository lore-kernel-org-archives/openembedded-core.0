Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 898067FD8C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 11:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E7E229C01D3;
	Fri, 24 Jan 2020 06:37:59 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id ps7INnCmMyuF; Fri, 24 Jan 2020 06:37:58 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 963E39C02B2;
	Fri, 24 Jan 2020 06:37:58 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id kfNbZmPPOpow; Fri, 24 Jan 2020 06:37:58 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 754759C01D3;
	Fri, 24 Jan 2020 06:37:58 -0500 (EST)
Date: Fri, 24 Jan 2020 06:37:57 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <1903874044.2188563.1579865877638.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <CAJ86T=X=B9n3xo+aOXhfnw8JT38z6Frk1RzT2Z6BR8hyLnAcSw@mail.gmail.com>
References: <670208445.2165783.1579785268358.JavaMail.zimbra@savoirfairelinux.com>
	<fc798fd12d4a06537fd235b6247a0193d1df3022.camel@linuxfoundation.org>
	<555772143.2167690.1579789341772.JavaMail.zimbra@savoirfairelinux.com>
	<b1cbeea067af1e54e596425c87b55b36062bb49f.camel@linuxfoundation.org>
	<1908740460.2169186.1579791546237.JavaMail.zimbra@savoirfairelinux.com>
	<91c23ebb8817e8cc5e0c1644529f6d3034749e53.camel@linuxfoundation.org>
	<CAJ86T=X=B9n3xo+aOXhfnw8JT38z6Frk1RzT2Z6BR8hyLnAcSw@mail.gmail.com>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - GC79 (Linux)/8.8.11_GA_3737)
Thread-Topic: Connectivity check uris
Thread-Index: /FExVqOykd57ngxquUguVM7h+TFO/w==
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
X-List-Received-Date: Fri, 24 Jan 2020 11:38:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Jan 23, 2020, at 8:25 PM, Andre McCurdy armccurdy@gmail.com wrote:
> On Thu, Jan 23, 2020 at 7:24 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Thu, 2020-01-23 at 09:59 -0500, Jean-Marie LEMETAYER wrote:
>> > On Jan 23, 2020, at 3:37 PM, Richard Purdie
>> > richard.purdie@linuxfoundation.org wrote:
>> > > On Thu, 2020-01-23 at 09:22 -0500, Jean-Marie LEMETAYER wrote:
>> > > > I understand the issue with blocked domains this is why I suggest
>> > > > the
>> > > > custom domain "connectivitycheck.openembedded.org".
>> > > >
>> > > > But I dont know if it could be an option. Can OE have a sub-
>> > > > domain
>> > > > like that? maybe using some cdn to handle the load?
>> > >
>> > > We can certainly setup domains but we can't easily get a cdn. I'd
>> > > be
>> > > worried about OE's response time too.
>> > >
>> > > > Another option will be to provide multiple URIs:
>> > > >     CONNECTIVITY_CHECK_URIS ?= " \
>> > > >         https://google.com \
>> > > >         https://www.bing.com \
>> > > >         https://www.baidu.com \
>> > > >     "
>> > >
>> > > Looking at the code, I wonder if a CONNECTIVITY_CHECK_MIRRORS,
>> > > injected
>> > > into MIRRORS internally with google as the default and baidu as the
>> > > mirror would work?
> 
> How about checking github.com? That's probably the host that a network
> dependent build needs to access most often.

It is a good idea!

To go further I have created a new GitHub repository to host a simple
index.html file using the GitHub Pages:
https://github.com/connectivitycheck/connectivitycheck.github.io

The URL of the page is here:
https://connectivitycheck.github.io

The results are good for me:
$ time ./connectivity_check.sh https://connectivitycheck.github.io
100 wget -qO- --timeout=1 --tries=1 https://connectivitycheck.github.io
100 curl -s --connect-timeout 1 https://connectivitycheck.github.io

real	0m17.202s
user	0m0.944s
sys	0m0.241s

Moreover github.com seems to be accessible in china.
(checked with: https://www.websitepulse.com/tools/china-firewall-test)

Finally the same thing can be done using GitLab. This could make it
possible to have mirrors.

Best regards,
Jean-Marie

