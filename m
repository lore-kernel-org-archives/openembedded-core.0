Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S7a6F-0004Jw-0A
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 23:21:47 +0100
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 13 Mar 2012 15:11:56 -0700
Received: by werf3 with SMTP id f3so1050302wer.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 15:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=/+PNZFWgZQbM9rXncRZVjyN3Btga/WNC5KupvoaElgg=;
	b=cfPYkcU5Brl8Tj9D59mGGwqMeNHwTpsJNuG/Naqg/jMo6JP5lE3TDArkxtY+g6X3yG
	O/VJdaMK/GUBCUG3Or4QShjTScNg957XvbMEXGSOA6vFGdfWENIkewYffoxZus5ipg9f
	kZ+W4IOew5E1ZpaCDQslhkQZXyRA/oEXHxl4k0Lm64BXxK0b39RRnk/vnoBDYi3Htyin
	w2GdVyyo96sgYthHnJfVTpJ2Ln+mWuLWj/iDqqjPuLLJh8xq9H9K6icxvJ7mbjbOe01C
	Phu04FF1Yw2JUl6KIqwdnfxAdaPwm/jE7rMtot6nJ3SlVFZE9FcsrHk7gkAUKJcdSAIx
	5fvw==
Received: by 10.180.107.162 with SMTP id hd2mr11200887wib.8.1331676714432;
	Tue, 13 Mar 2012 15:11:54 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id k6sm23120134wie.9.2012.03.13.15.11.52
	(version=SSLv3 cipher=OTHER); Tue, 13 Mar 2012 15:11:54 -0700 (PDT)
Message-ID: <4F5FC61E.1040708@intel.com>
Date: Tue, 13 Mar 2012 15:11:42 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1331604310.git.scott.a.garman@intel.com>
	<f876555e0b49baed50840adb1d93e8338ab9d7ef.1331604310.git.scott.a.garman@intel.com>
	<4F5FB36A.8020007@opendreambox.org>
In-Reply-To: <4F5FB36A.8020007@opendreambox.org>
X-Gm-Message-State: ALoCoQlSMNUR2GN9o+ZOooKgOw52wQRACR6S+3q4wDlQaVY6TuKoq+8dhimtt4Hcs59JVVOn3qjq
Subject: Re: [PATCH 2/3] ncurses: move only libncurses and libtinfo to base_libdir
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
X-List-Received-Date: Tue, 13 Mar 2012 22:21:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/2012 01:51 PM, Andreas Oberritter wrote:
> On 13.03.2012 03:08, Scott Garman wrote:
>> The previous approach to moving the ncurses libraries to
>> base_libdir was too aggressive, and it broke curses support
>> in python.
>>
>> Instead, move only libncurses, libncursesw, and libtinfo to
>> base_libdir and leave the remaining libraries in libdir.
>>
>> Also delete ${libdir}/terminfo as it never gets packaged to
>> avoid a QA warning.
>>
>> This fixes [YOCTO #2070] and is a partial fix for [YOCTO #1937].
>
> Hello Scott,
>
> package splitting doesn't seem to work anymore. Libs that previously had
> their own package now end up being stored in the main ncurses package.

Thanks for reporting this, Andreas. I am working on a fix for it now. My 
apologies for the trouble.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


