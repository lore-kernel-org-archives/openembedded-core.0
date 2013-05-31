Return-Path: <net147@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id D613A6A34E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 10:34:09 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id 6so1978031pdd.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 03:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=IDJY1W/qx7Md6rBnxyO8qfleTIObNFmvffW/RERamwE=;
	b=acBvUEnp9KNf+RIgJUb+VYBrGBqgBjN/eQrKKNynQSNmRx/Qrp1vTtCRkw//PpcsZm
	v0Re0ShOFRKAbu1IgsKHkxaOKgN40BdAAl7wA0NJTkpdiyM0guZLYHJ/vCUpeu1NF7Nu
	JMdhMwPfCiWe9QUYmJtYD/atiA7kCMy4K3AbFCxs/v0t5uULeXq3wmp/10KbCO9poisA
	ArkSiOJnQ7qCxWekgWamhdFsiAmUAxN1YqxBnDoUQ/XRcScUuF+I6EvC+YyCrkKp7aO/
	TfmL3LlWnc5dn2r7UhwCtWg4jnNwWepcTGEj8547ds9+UTo+G0XTM1AeSRN6ERjIjTsq
	ezBw==
X-Received: by 10.66.250.131 with SMTP id zc3mr12716016pac.157.1369996451005; 
	Fri, 31 May 2013 03:34:11 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id ri8sm46185678pbc.3.2013.05.31.03.34.08
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 03:34:10 -0700 (PDT)
Message-ID: <51A87B7F.7050702@gmail.com>
Date: Fri, 31 May 2013 20:29:19 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1369993335-21441-1-git-send-email-net147@gmail.com>
In-Reply-To: <1369993335-21441-1-git-send-email-net147@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory: record removals with Git 2.0 and later
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
X-List-Received-Date: Fri, 31 May 2013 10:34:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 31/05/2013 7:42 PM, Jonathan Liu wrote:
> There is a behavior change with Git 2.0 where "git add ." will no
> longer record removals by default unless -A (--all) is specified.
> Change to "git add -A ." so removals are recorded with Git 2.0 and
> later.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   meta/classes/buildhistory.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
Hmm... looks like I interpreted the Git warning incorrectly. Maybe I 
need to look into this a bit more and perhaps change the commit message.

The following appears after a build with buildhistory enabled:
warning: You ran 'git add' with neither '-A (--all)' or '--ignore-removal',
whose behaviour will change in Git 2.0 with respect to paths you removed.
Paths like 'test.txt' that are
removed from your working tree are ignored with this version of Git.

* 'git add --ignore-removal <pathspec>', which is the current default,
   ignores paths you removed from your working tree.

* 'git add --all <pathspec>' will let you also record the removals.

Run 'git status' to check the paths you removed from your working tree.

Regards,
Jonathan

