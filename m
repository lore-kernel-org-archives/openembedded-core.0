Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id C6C4E6B7B3
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 11:58:00 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id i10so476404oag.30
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 04:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=iJ8i8vDHe1rDRXGVmmHccVWJstqn+mzBOXNnwSIYKHQ=;
	b=QWgwTwGuHUv7hER3jrZiDAzkBIeRr6OEBfrW7JSBjV5hU5xnVEnTOzpegPNdY+96gZ
	Mdd7/PyQLQLzG0pDEI/oiy5orqXnMgOpHy8pQV2JPOUP/1LkuY/2hnlajFCGbQNNHjqF
	E2qjMQ3/Z8dVue7nQmUahsqRtgkm4wS14zifPIbUfQKzxd1OVXFthf3PysWzdEZkD1Th
	69aJ/W3lUfEKtNW3054aziEyJzk7D9hrPtrfNKLkz4B/jpK6UC6xHbw0eP7bD3PBmmnk
	UHtUTNZLHjRLPSfYq7IbSekX2Re1pr29HcKJhz8QL9ARcJWjmZLaPIMcQcieLBhcDwkI
	Gfqg==
MIME-Version: 1.0
X-Received: by 10.182.191.36 with SMTP id gv4mr198795obc.103.1376999880987;
	Tue, 20 Aug 2013 04:58:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 20 Aug 2013 04:58:00 -0700 (PDT)
In-Reply-To: <CAJTo0LayXbOWSnT=F5=ud2Vy__b0ipc9Xx6ujKkups2zWSLM7A@mail.gmail.com>
References: <cover.1376939912.git.nitin.a.kamble@intel.com>
	<b8e848c82d5c361278328b0569509f6cc4f58d36.1376939912.git.nitin.a.kamble@intel.com>
	<CAJTo0LayXbOWSnT=F5=ud2Vy__b0ipc9Xx6ujKkups2zWSLM7A@mail.gmail.com>
Date: Tue, 20 Aug 2013 08:58:00 -0300
X-Google-Sender-Auth: QnbXzSHW2Nl91CfFEhlYh30LBE4
Message-ID: <CAP9ODKpxNe3zw4_HgYJZksDvr4tr-Jq9FxBc28kqqpjbzP=C0w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sanity.bbclass: a new check for required distro features
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
X-List-Received-Date: Tue, 20 Aug 2013 11:58:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 20, 2013 at 8:11 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 19 August 2013 20:22,  <nitin.a.kamble@intel.com> wrote:
>> Now these BSPs can specify in their BSP config, what distro features
>> are required, and if these are not enabled then appropriate build
>> error is thrown to help fix the issue.
>
> Are there any situations where these distro feature dependencies can't
> be expressed more precisely in a package recipe, and then something
> like Otavio's approach of throwing a SkipPackage used?

I have several cases in meta-fsl-demos. Vivante GPU driver provides
different libraries depending on the backend to use (DirectFB, FB,
Wayland and X11) and they cannot be used at same time. So depending on
distro features setting some images are buildable or not.

In fact I see same case in OE-Core; core-image-weston /depends/ on
wayland distro feature and this is not explicit in metadata nowadays.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

