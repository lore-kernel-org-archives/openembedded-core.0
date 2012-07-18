Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrSnM-0001yZ-19
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 13:51:56 +0200
Received: from mail-qa0-f52.google.com ([209.85.216.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 18 Jul 2012 04:40:33 -0700
Received: by qabj34 with SMTP id j34so804157qab.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 04:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=iub70UpzOc4zPCQBA5h5tf+2ow8wQwp6sVVsyx77FnM=;
	b=T50k5NB71Yg/vNWv/yR/VnL7VL6klmEInAtVPgKxEorj47rVLXQwfDSKYbW/o1kZTW
	xos59NuYudqp6LPL+acHth+FrqSn/qEQBLkQVCpa4TMg/hNteh9sQU9WE6z56C++6BrF
	zRT5jis9aydtjuvbPwzihNVRDGdyaGrSVl9v9wlSjY7DjpDyKIIxRScP8rYG2Nla9LSG
	LL8g0gh8mDrFsn7tP/LQ6AIeZpDR6oCus+f80R582FtiCpax9nQN7Jptmw3D6LI72NjH
	cqxa+r9pJ0shZfbV/UwiDijeESHv7jtLPsnd3pMlSVPKo1/HQ+d8LDpb8DPhjvKGXV4X
	0yEw==
Received: by 10.224.177.1 with SMTP id bg1mr5290662qab.68.1342611632375; Wed,
	18 Jul 2012 04:40:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.82.74 with HTTP; Wed, 18 Jul 2012 04:40:12 -0700 (PDT)
In-Reply-To: <20120718112359.GC29030@mi.fu-berlin.de>
References: <CAJTo0LY9WbxAW35NS-C1M4_rpDDD6SCXcRPw7OtdoR5WkFZirA@mail.gmail.com>
	<20120718112359.GC29030@mi.fu-berlin.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Jul 2012 12:40:12 +0100
Message-ID: <CAJTo0LYO9xT3sfBR_cQw6=76HqEaYaOzktG861_QXaVwsV5c0Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkY7vNGsuOppOshTQefXBvKK8nt/uUdazSQvgDIWqB26Js1yb0QsiT3yTn1ZfvpoD+3GMsm
Subject: Re: eglibc-initial trying to remove files in /usr
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 11:51:56 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2012 12:23, Henning Heinold <heinold@inf.fu-berlin.de> wrote:
> NOTE: make PARALLELMFLAGS=-j 8 cross-compiling=yes prefix=/usr
>
> So it tries to install eglibc to the host dirs which is of course failing.

The mechanics of building eglibc is beyond me -- yesterday's clean
build worked fine so something in the last day must have broken it.
Any ideas?

Ross


