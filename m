Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SZfhY-0007E9-Vp
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 12:00:25 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga03.intel.com with ESMTP/TLS/RC4-MD5; 30 May 2012 02:50:05 -0700
Received: by qcmv28 with SMTP id v28so2386216qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 02:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=6C0mR5eKcAgNNAUMKa3Z7VtSmHwWATrCMJKSNQUa6xA=;
	b=Ry/lwYpgRsPCLEYdG38JjYjJFGST7FBGXEMctH0FR09sLYa4DtChdRR6+OhN3+4X2J
	BpnhC9QdRCE7KYwo8ouuEd2ZMLQzQsdCkK+LsWIV4Sy6ZuWHuBPtE0tU7baULrlVpgff
	rArRQN5X1GmBbtFQMiKiZ2OGuyHGn5Y+hDLrnKG9cRYtmN+CbhSrMjzuhGKvXI+vKrTS
	1JDpYfrTc0jguDBJS4xBG3lug5ChO+M4rkUnyWw1YxEW8ZHEmlfSH0OMuQc6vuP5jYGf
	U4R20WSe4lXKDccAf4EtoIkkSV0aM3ilvAqi9UVE1vbi9QN77gItFhkKYaLuSqO3aemn
	26Jw==
Received: by 10.229.115.12 with SMTP id g12mr4731158qcq.51.1338371403756; Wed,
	30 May 2012 02:50:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.53.212 with HTTP; Wed, 30 May 2012 02:49:42 -0700 (PDT)
In-Reply-To: <CAMKF1so_=OjU2OcoVYO=B5g2KzYAgtY4aA4gNr_cv09YFcxbeQ@mail.gmail.com>
References: <cover.1338323483.git.ross.burton@intel.com>
	<e50f2bf59b64accf580fc2df96e1fbc9eb6cfb98.1338323483.git.ross.burton@intel.com>
	<CAMKF1so_=OjU2OcoVYO=B5g2KzYAgtY4aA4gNr_cv09YFcxbeQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 30 May 2012 10:49:42 +0100
Message-ID: <CAJTo0LYe1y0r-VhGqsZ1ejfhN39Awd61Zq6yGk0Bf=VN+zJrHA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmQNRxJSadnb/dAYFdvkexITFUU/3vT0JXZnaoSWEK4wLcf8B84euZ6QzKGU+v5cdy3BHXJ
Subject: Re: [PATCH 1/4] connman: just give xuser the extra rights it needs
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
X-List-Received-Date: Wed, 30 May 2012 10:00:25 -0000
Content-Type: text/plain; charset=UTF-8

On 30 May 2012 03:59, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, May 29, 2012 at 1:43 PM, Ross Burton <ross.burton@intel.com> wrote:
>>
>>
>> -Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
>> +Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> why remove the old sign-off ?

The patches are semantically different - Dongxiao's solution was to
copy the root rules, my solution is to copy the at_console rules.  He
didn't sign off my solution, so I removed his sign-off.

Ross


