Return-Path: <net147@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4014460810
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 23:29:12 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id bv13so401257pdb.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 16:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=vrDVjCmfMdEs3Z7Jgi5oLa8gpCVVAGhX+kB7PwX4vYo=;
	b=ekQNkivy2nPgEciFvEo5zHBCtCvN4zX88THOlNLKA8if1W+SftnrrjP3jE4QGZgf2a
	U2onYz+FYq/KS/zEZ2eCs8KephV8pU3zKkczsB1l4zBTBHE8Xhu9jxOtreYfuySGKKKJ
	IQMOJCJ7rhNsxrRQajmDwjh0seuT0TclDp8r2AqHboADWjVzcLIt5cuwv+IZNrmeHzAR
	KxkiVAC9KN+zV9ffDmFFwTQJuuXeDbeadpS19gWPurZqghGpbyWMooBERZJNbLYt6E+q
	UHJtApbQ+wMFiDvarDWH5claPnMwlzjTAVBqZsorIBgcL4Nb/C5LBENePydWlCvjxTOF
	C3Zg==
X-Received: by 10.68.190.131 with SMTP id gq3mr10224596pbc.185.1369265353420; 
	Wed, 22 May 2013 16:29:13 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id cp1sm8973685pbc.42.2013.05.22.16.29.10
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 May 2013 16:29:12 -0700 (PDT)
Message-ID: <519D53A4.4070505@gmail.com>
Date: Thu, 23 May 2013 09:24:20 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1369263517.git.sgw@linux.intel.com>
In-Reply-To: <cover.1369263517.git.sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/34] Update patch set
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
X-List-Received-Date: Wed, 22 May 2013 23:29:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2013 9:03 AM, Saul Wold wrote:
> Jonathan Liu (3):
>    util-linux: Update to 2.23
>    populate-volatile.sh: remove repeated leading slashes in TNAME
There was a small issue with populate-volatile.sh patch and I have 
submitted v4 (changed -n to -z in the last if condition). Please remove 
v3 patch or update it to v4.
>    busybox: backport sulogin empty root password fix
Regards,
Jonathan

