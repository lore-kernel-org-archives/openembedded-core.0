Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id D073D600FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 01:59:10 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id uo1so7303069pbc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 18:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:user-agent:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type;
	bh=IdZTgZ4CC+hQZUtvHr3N/Nh5+53dmUtBm0vZhQpDV5g=;
	b=mHN5CLgenK5U/fSgS8zFzglU9j/Pwsl/NdbdA1W/c16Ts4TqLF7TelHi6/O8fUy8w0
	4qDtNHx36itFfsbBBbUShOfH1jllGbUetxF7qMKht0xm1XNQ5JnG7BA8LIy01Oh6pkpM
	NkmWu3fR60nB11z/LujhEVYomRy8uY/S7vaKmHUH1+eajmJP/wAPI1h2VewXaunI20RO
	EOLsaHrSYe/UwJ1I9zwDwYPgB58J6OYFYUdKAn8wxg6Ev/Tyv4LEs/TGpBLpNfGywRNO
	HDa9Pkqe9NezqCUSrZHidbyyqs4A1D1UC4HAH2H5z9TdIRozDgHlFzvQUMd7jNIfddei
	83Rw==
X-Received: by 10.66.229.106 with SMTP id sp10mr19039556pac.117.1373507951704; 
	Wed, 10 Jul 2013 18:59:11 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([180.109.90.85])
	by mx.google.com with ESMTPSA id
	zv11sm39056568pab.3.2013.07.10.18.59.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 10 Jul 2013 18:59:10 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jul 2013 09:54:28 +0800
Message-ID: <4753381.i1zt9jKOiD@yiqingliang-pc>
User-Agent: KMail/4.10.4 (Linux/3.9.8-1-ARCH; KDE/4.10.4; x86_64; ; )
In-Reply-To: <2457726.ZAE80f4V8O@yiqingliang-pc>
References: <2457726.ZAE80f4V8O@yiqingliang-pc>
MIME-Version: 1.0
Subject: Re: boost 1.54 compile fail
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
X-List-Received-Date: Thu, 11 Jul 2013 01:59:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

maybe it is the gcc's fault (recently it is updated to 4.8.x in poky)

I can found uintptr_t in cstdint, but it is wrapped by a c99 related macro.


On Wednesday, July 10, 2013 04:21:02 PM Yi Qingliang wrote:
> Hello!
> 
> after update poky to latest git version, I got failure when compiling boost:
> 
> the main error is: (indeed, and too many warning!)
> 
> | ./boost/atomic/atomic.hpp:202:16: error: 'uintptr_t' was not declared in
> 
> this scope
> 
> |  typedef atomic<uintptr_t> atomic_uintptr_t;
> |  
> |                 ^
> | 
> | ./boost/atomic/atomic.hpp:202:25: error: template argument 1 is invalid
> | 
> |  typedef atomic<uintptr_t> atomic_uintptr_t;
> |  
> |                          ^
> | 
> | ./boost/atomic/atomic.hpp:202:43: error: invalid type in declaration
> | before
> 
> ';' token
> 
> |  typedef atomic<uintptr_t> atomic_uintptr_t;
> |  
> |                                            ^
> | 
> | In file included from ./boost/system/system_error.hpp:14:0,
> | 
> |                  from ./boost/thread/exceptions.hpp:22,
> |                  from ./boost/thread/pthread/thread_data.hpp:10,
> |                  from ./boost/thread/thread_only.hpp:17,
> |                  from libs/thread/src/pthread/thread.cpp:11:
-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com

