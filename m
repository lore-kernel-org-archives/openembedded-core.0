Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.16212.1587301920149936862
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Apr 2020 06:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:33036 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jQ9jp-006K0E-Li; Sun, 19 Apr 2020 09:11:58 -0400
Date: Sun, 19 Apr 2020 09:11:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: Christopher Larson <kergoth@gmail.com>, 
    Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
    "chris.laplante@agilent.com" <chris.laplante@agilent.com>, 
    OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] why does oe-buildenv-internal check for -z "$BDIR"?
In-Reply-To: <d2f052416cef21416444e08512f84dd8c4f1aeca.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.21.2004190910470.1292842@localhost.localdomain>
References: <alpine.LFD.2.21.2004181159130.1300328@localhost.localdomain>  <e610ad1ecb7cd084ab61fe4bcf56b01568c5edc7.camel@linuxfoundation.org>  <alpine.LFD.2.21.2004181235160.1301461@localhost.localdomain>  <DM5PR12MB24711A9EF9D90BB86E95EDAA8BD60@DM5PR12MB2471.namprd12.prod.outlook.com>
  <alpine.LFD.2.21.2004181320230.1304434@localhost.localdomain>  <fc3149fc55b34156baee2c375002a2a6@XBOX03.axis.com>  <alpine.LFD.2.21.2004181605480.8183@localhost.localdomain>  <d1b1bb06-3222-4073-831d-7f25e2566ed5@Spark>  <alpine.LFD.2.21.2004181815360.571354@localhost.localdomain>
 <d2f052416cef21416444e08512f84dd8c4f1aeca.camel@linuxfoundation.org>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=1.3
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Sun, 19 Apr 2020, Richard Purdie wrote:

> On Sat, 2020-04-18 at 18:17 -0400, Robert P. J. Day wrote:
> >   that actually matches with what i concluded -- BDIR is dead and
> > gone, but i realized that BITBAKEDIR could still be useful, even
> > if it's currently undocumented. so i'll submit a patch to ditch
> > BDIR, and leave all else as is. for now.
>
> BDIR allows the build directory to be set explicitly from a script
> without worrying about which shell is in use.

  i believe you, and i actually went specifically *looking* for
something that did that, but didn't find it.

> I'd note it is used by scripts/build-perf-test-wrapper in yocto-
> autobuilder-helper, probably for exactly this reason (I've not
> checked the history).

  and that's the snippet of info i was after ... that *something*
takes advantage of that feature.  ok, i'm happy now. :-)

rday
