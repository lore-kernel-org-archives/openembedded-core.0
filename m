Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T1Xj6-00083R-LB
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 09:09:19 +0200
Received: from mail-yx0-f180.google.com ([209.85.213.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 14 Aug 2012 23:57:06 -0700
Received: by yenl8 with SMTP id l8so1335408yen.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 23:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=/JzCi1nRyknnaCXbABX9KaEmuqZS5PFjMWO4JbzURfc=;
	b=W/rA2wo831dArQ2+S9SrvIrL5+vVwMiJQzcR/y2HmV/TA47bLixyrBfY2qGuQbFgwh
	3lUn0EMkNQ88WC/zuVHK2nLFzXC7Q8Yhs/7AJf+oOTFSiSNo3NGB8AhxzLLb3+a3V8wT
	FzMVVk//3ntEMvHIuWUz4WxV8cYFsm1u3u+U3MM1PDJJMMk+KBGqVskYJj0K/UGmGH8E
	Ik/A/6AzxUpDtkz95zH35GfJIPVUdqvRhjvY/dacbFt44qGYXPTZYzSRVR+M9edBBKMx
	IjrK9a1C/vtfaxrbQ5jSbZJ2rUrN3VXS5jhVxCe/YPe/iJTj1LZ+Gv8Z+ABcmCEY9tLu
	Swwg==
Received: by 10.50.236.8 with SMTP id uq8mr15841114igc.1.1345013825173; Tue,
	14 Aug 2012 23:57:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.146.103 with HTTP; Tue, 14 Aug 2012 23:56:45 -0700 (PDT)
In-Reply-To: <502AF9CD.9020508@linux.intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
	<502AF9CD.9020508@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Aug 2012 07:56:45 +0100
Message-ID: <CAJTo0LYPEOfgDhiKgh9G3Jsyi39hcU99qd0P_0UNL7NEwcY0PA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQlTBb9pxXd1HVmjA1zzjFzDKxPy/BxWKYVxg9evU5IgVuIB8ZOMWNL3nsvL42iIZ1nPfULA
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Enable EGL and GLES in x86 Mesa
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
X-List-Received-Date: Wed, 15 Aug 2012 07:09:22 -0000
Content-Type: text/plain; charset=UTF-8

On 15 August 2012 02:22, Saul Wold <sgw@linux.intel.com> wrote:
>> | ../../../../include/GL/internal/dri_interface.h:51:17: fatal error:
>> drm.h: No such file or directory

Not what I was expecting.  I've kicked off a local qemuarm build to investigate.

Ross


