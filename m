Return-Path: <marek.vasut@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 932997C099
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 20:49:28 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id p4so12932427wrt.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 12:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=yfp0gvyIGUW5PXlz/A7RQQtsYJu116Lv6XA4jfozGSQ=;
	b=pYQ+VWB5B4AMczZzjBaDofNucZzhYHR+A8r/ZEGitdDV5CXMSU0yLf+SZIu1s2i/mw
	kAfwjPLK95GPFmdnxjoKpA5KxDfB79x6ZGcy9hSgyguUq0oS6XAKefJnMK883+R8rmbX
	sZv4guUodiboeFM+92V93w5LijGkM4bK3hy788MeQR6G17WAeLak9UWfQCgtK8FDLyIY
	14kubWzt41TyB7jVob67nKe9RZMkMHQaqdFFMwNDMaCMogGeITroYriCFjv5cDDNsEgx
	O/RHY2LkcHmp3dXBM8DOVVC3SgcxXqgcBdcWzLhxFCczrIpynUJi7Wt++8xqTZIJ6HCp
	bKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yfp0gvyIGUW5PXlz/A7RQQtsYJu116Lv6XA4jfozGSQ=;
	b=D143i0Ef98qYSSjqa43SLseJzZpriWs1wIrTU3FX2vagbRHhFIl7xsdh11mxx5mJCf
	ybfsmsKdD8vNx2ZWhYStPIlj/U/Yyy67muNQUbS9NFKMPZrQOZHTHEW1cAbgdG5KfUu1
	NvYw77Anj3KRKGeeeqLuyTAgsrz41UP3WM0Jjr3BokpC7H9yuUAZ/IVHK6wgNEDVvA6w
	y1eS17E9cjGwuBwIpg5MgNfXUogEb8TXmop6NAVhi1dv0DLdkVYGNQ24lLQNQsmVYzhj
	A+N+Aps+fj98r9wZA0N9h+4/NAP+izIc01zrOCGgPTsZ5sQtUuJHysgl3kJb7o9arqbM
	f/Ug==
X-Gm-Message-State: AJcUukdkCoee4WUtvrEHDjpL4Bq+HeyUqQHtsfWJMTv9jbMh3Gcm3HiJ
	l3foruUrPua7+1/pkXDkIFuGteRl
X-Google-Smtp-Source: ALg8bN4mDiL+Ckq8R9IVRr436o5y7YvqM9zopUbe05MhrwpyOqVHWl2Z6x56bwY2YuGyhr2Lk3JJ2g==
X-Received: by 2002:adf:92c7:: with SMTP id 65mr10179972wrn.228.1547153368837; 
	Thu, 10 Jan 2019 12:49:28 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz.
	[86.49.110.70]) by smtp.gmail.com with ESMTPSA id
	i192sm16042392wmg.7.2019.01.10.12.49.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Jan 2019 12:49:28 -0800 (PST)
To: akuster808 <akuster808@gmail.com>, Ferry Toth <ftoth@telfort.nl>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <bb4e7e77-fc77-d180-cf50-aecc92c42c24@telfort.nl>
	<af7fc6ac-01d9-8132-6ca7-1586afc3bc57@gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <34a5a2d4-f6bc-328d-d535-54dcbf55af28@gmail.com>
Date: Thu, 10 Jan 2019 21:49:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <af7fc6ac-01d9-8132-6ca7-1586afc3bc57@gmail.com>
Subject: Re: Sudden errors building Sumo
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
X-List-Received-Date: Thu, 10 Jan 2019 20:49:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/10/19 9:48 PM, akuster808 wrote:
> 
> 
> On 1/10/19 8:23 AM, Ferry Toth wrote:
>> After a new checkout I am experiencing multiple errors building Sumo
>> that might be related:
>> bison-3.0.4
>>
>> cross-localedef-native_2.27
>>
>> coreutils-8.29
>>
>> On another machine with slightly out-of-date Sumo these problems do
>> not occur.
>>
>>
>> Detail below.
>>
>>
>> Any ideas how to fix?
> Can you provide how you are building this ie, local.conf, MACHINE and host
> 
> What are your before and after commit hashes used?
> 
> - armin
>>
>> Ferry
>>
>>
>> virtual:native:/home/ferry/Develop/tmp/out/linux64/poky/meta/recipes-devtools/bison/bison_3.0.4.bb:do_compile
>>
>>
>> | ../bison-3.0.4/lib/fseterr.c: In function 'fseterr':
>> | ../bison-3.0.4/lib/fseterr.c:77:3: error: #error "Please port gnulib
>> fseterr.c to your platform! Look at the definitions of ferror and
>> clearerr on your system, then report this to bug-gnulib."
>> | #error "Please port gnulib fseterr.c to your platform! Look at the
>> definitions of ferror and clearerr on your system, then report this to
>> bug-gnulib."
>> | ^~~~~
>>
>>
>> /home/ferry/Develop/tmp/out/linux64/poky/meta/recipes-core/glibc/cross-localedef-native_2.27.bb:do_compile
>>
>>
>> | /home/ferry/Develop/tmp/out/linux64/build/tmp/hosttools/ld:
>> argp-fmtstream.c:(.text+0x525): undefined reference to `_IO_fwide'
>> | /home/ferry/Develop/tmp/out/linux64/build/tmp/hosttools/ld:
>> argp-help.o: in function `argp_failure':
>> | argp-help.c:(.text+0x20b3): undefined reference to `_IO_fwide'
>> | collect2: error: ld returned 1 exit status
>>
>>
>> virtual:native:/home/ferry/Develop/tmp/out/linux64/poky/meta/recipes-core/coreutils/coreutils_8.29.bb:do_compile
>>
>>
>> | ../coreutils-8.29/lib/freadseek.c: In function 'freadptrinc':
>> | ../coreutils-8.29/lib/freadseek.c:68:3: error: #error "Please port
>> gnulib freadseek.c to your platform! Look at the definition of getc,
>> getc_unlocked on your system, then report this to bug-gnulib."
>> | #error "Please port gnulib freadseek.c to your platform! Look at the
>> definition of getc, getc_unlocked on your system, then report this to
>> bug-gnulib."
>> | ^~~~~

Sounds like one of those glibc-2.28 problems ?

-- 
Best regards,
Marek Vasut

