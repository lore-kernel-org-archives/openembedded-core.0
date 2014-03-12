Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0399F6F7A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 10:24:31 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id j5so28498664qga.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 03:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mdTz1e/Ae19bg5rIyyaWwYJRteJbxA9uhAwSmH3/Ys4=;
	b=DvnEAWjX+oPLDcLtTs2VT2MUPHsWWOyiWEDup4ePAIHyOqFLCzAcxC0GpGcUqNNCkt
	g7uTbDwH7XD3Q9n3yAVkQQoavffxA7dkpLKsrwUqCxj2rajrIBtQDpSJ3x5ubPuTFZID
	4t7rsrYY8dbdPbtN9zaPN83Pc75yHSLcZC/CiFx5PjzB7DMCbZL7qRuN4HP5TxyOfs4W
	Y8XdBjeBE+a0NynkxZ5fS9DkU5hE+ceXnrs07YkXirv7e2KZqya9PtGUiPsnwYfR9LpB
	0alzX/ZP9j7+IfmxelG0ggVMoB+KYjKHTXoIyIA5Q/qfpv5W0Qn9NcA3V9UC/OXTFjUA
	AtcA==
X-Gm-Message-State: ALoCoQmso83RpUj+q5/rrk1WWvxYSf1GjE7SP1s8D0Lxcq91tqIU4FWz7L5t4C5Nqv/PRDKkJ5jg
X-Received: by 10.140.106.195 with SMTP id e61mr42425886qgf.66.1394619872436; 
	Wed, 12 Mar 2014 03:24:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Wed, 12 Mar 2014 03:24:12 -0700 (PDT)
In-Reply-To: <1394613382-28992-7-git-send-email-alexandrux.palalau@linux.intel.com>
References: <1394613382-28992-1-git-send-email-alexandrux.palalau@linux.intel.com>
	<1394613382-28992-7-git-send-email-alexandrux.palalau@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Mar 2014 10:24:12 +0000
Message-ID: <CAJTo0Lb99nwJzSFUHtZ2DU=fLRSxT+nvJoZcPfyfj_CP=kmuPw@mail.gmail.com>
To: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] gtk-engines: removed gconf inheritance
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
X-List-Received-Date: Wed, 12 Mar 2014 10:24:32 -0000
Content-Type: text/plain; charset=UTF-8

On 12 March 2014 08:36, Alexandru Palalau
<alexandrux.palalau@linux.intel.com> wrote:
> -inherit gnome
> +inherit gnomebase gtk-icon-cache mime

Are you sure mime is needed here?

Ross

