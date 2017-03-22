Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4D17D719B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 16:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2MGW7LE002510; Wed, 22 Mar 2017 16:32:07 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QziICBkH7Bjp; Wed, 22 Mar 2017 16:32:07 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2MGW1gh002501
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 22 Mar 2017 16:32:02 GMT
Message-ID: <1490200321.13980.177.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Mar 2017 16:32:01 +0000
In-Reply-To: <CAJTo0LZV4kh3=r=cxYpBydGO74R6cvootczedwMW3s_k1xxSWQ@mail.gmail.com>
References: <alpine.LFD.2.20.1703220707490.15622@uk63952.mitel.com>
	<CAJTo0LZe1-9x4=w5KtK0AVFo5TawB=Ceohvmw48qy+QkyrhMLg@mail.gmail.com>
	<CADkTA4Oj1mC+CMoT=DJAzsDtmCnm6TdZAO_xVFhujg+3kiwWVw@mail.gmail.com>
	<CAJTo0LaNwjnEvRRYrXwP6DJptvHc0Cm6E2QZyVEKsk1xLVoNJA@mail.gmail.com>
	<CADkTA4NhsEnk1j=_i3ahu2Lt23t802wn7yfyb5-fK9K3XAdM_Q@mail.gmail.com>
	<alpine.LFD.2.20.1703220821160.16426@uk63952.mitel.com>
	<CADkTA4OV+n4cMpR-6GTbM+Qu+bJ8TNntOXyQ7UWYDLHtB_JYfg@mail.gmail.com>
	<1490194798.13980.172.camel@linuxfoundation.org>
	<CAJTo0LZV4kh3=r=cxYpBydGO74R6cvootczedwMW3s_k1xxSWQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: design question: should layer.conf contain "PREFERRED_VERSION" settings?
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
X-List-Received-Date: Wed, 22 Mar 2017 16:32:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-22 at 15:44 +0000, Burton, Ross wrote:
> 
> On 22 March 2017 at 14:59, Richard Purdie <richard.purdie@linuxfounda
> tion.org> wrote:
> > What should happen is that the openstack recipe should complain
> > loudly
> > (error) if anyone tried to build it (or parse it?) with anything
> > except
> > the versions its known to work with.
> > 
> Is this a good time to bring up versions in DEPENDS?

Yes. I'd swear there was a bug for this but I can't find it. I know we
made versions able to be added to DEPENDS without parse failures, its
just a question of getting bitbake to parse them.

> It would be awesome to automatically set PREFERRED_VERSION as
> appropriate depending on the constrains in DEPENDS, but I'd be really
> happy with errors if the versions specified were not selected.
> 
> So in this case openstack could do DEPENDS=python-something (>4.0)
> and bitbake would error out if python-something v3 is being built.

I don't think setting PREFERRED_VERSION magically would be good but I
do like the rest of the idea, its always been the intent really...

Someone needs to file a bug...

Cheers,

Richard

