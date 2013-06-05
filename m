Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 549B66A598
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 16:58:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Jun 2013 09:58:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,808,1363158000"; d="scan'208";a="324746872"
Received: from unknown (HELO [10.255.13.19]) ([10.255.13.19])
	by orsmga001.jf.intel.com with ESMTP; 05 Jun 2013 09:58:23 -0700
Message-ID: <51AF6E2F.8040309@linux.intel.com>
Date: Wed, 05 Jun 2013 09:58:23 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <1370417067-30166-1-git-send-email-nicolas.dechesne@linaro.org>
	<51AF67B8.20502@linux.intel.com>
	<CAP71WjzSHWmKYLTs3_Ao6Mt_sKnUdNCHM3dSMSs8FpKbVyuCoQ@mail.gmail.com>
In-Reply-To: <CAP71WjzSHWmKYLTs3_Ao6Mt_sKnUdNCHM3dSMSs8FpKbVyuCoQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH dylan, master] Fix meta-toolchain-qte SDK build for x11-less DISTRO
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
X-List-Received-Date: Wed, 05 Jun 2013 16:58:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2013 09:32 AM, Nicolas Dechesne wrote:
>
> On Wed, Jun 5, 2013 at 6:30 PM, Saul Wold <sgw@linux.intel.com
> <mailto:sgw@linux.intel.com>> wrote:
>
>     You could just directly put the nativesdk-libx11 in place of the
>     variable, no need to have the variable there.
>
>
> yes, that's what I had initially, but found it was less easy to read...
> with X11DEPENDS it's more 'obvious' that there is something special..
> that said, i can make the change if that's really needed.
>
We do use the X11DEPENDS elsewhere when there are multiple dependencies, 
but I also found cases where we just include the dependency directly in 
the test. I was trying pick a direction: single entry no X11DEPENDS, 
multiple entries use X11DEPENDS.

Comments, flames, ...

Sau!


