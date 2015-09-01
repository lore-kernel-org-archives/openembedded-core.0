Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id DFAEE76A51
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 12:18:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id D5C555188051
Message-ID: <1441109890.4029.6.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: "Bystricky, Juro" <juro.bystricky@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 01 Sep 2015 13:18:10 +0100
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B6101E559A@ORSMSX109.amr.corp.intel.com>
References: <6E51916E4A1F32428260031F4C7CD2B6101E559A@ORSMSX109.amr.corp.intel.com>
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Mime-Version: 1.0
Subject: Re: [fido] Please backport commit
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
X-List-Received-Date: Tue, 01 Sep 2015 12:18:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Juro,

On Fri, 2015-08-28 at 20:53 +0000, Bystricky, Juro wrote:
> Hello Joshua,
> please backport the Yocto master  commit (cherry-pick)
> 625e0ec8b5e5f1c39b3bfad0e6adfecaf957d689 :“glibc: Consider adding 
> -Wno-error in cases when not using -O2”
> to Fido.

I've queued this cherry-pick in my fido-next branch[1], thanks for
proposing it.

Regards,
Joshua

1. http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshua
gl/fido-next

>  
> This is needed in order to fix the Fido bug 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=8214.
>  
> Thanks
>  
> Juro Bystricky

