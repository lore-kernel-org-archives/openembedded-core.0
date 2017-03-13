Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id D226160102;
	Mon, 13 Mar 2017 07:09:26 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id j5so65925349pfb.2;
	Mon, 13 Mar 2017 00:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=m+7dw5hKmXsp338KtR2XOfjWsndpiMW08FHL45jw1UU=;
	b=p4MR4lR/NKojBNjR5fCNH/xg66YkeBT0Zjwt88b9J+r8wy7jvCKhORtoQC6dfdSywM
	Lk/6AcsdF970ZiZcM3BK14CEzR7IaAorljsK1F7WnN1ie5iIbix9aZPGyNdFXlJh6K5l
	AuGOugmCEIJSLOf948dzDcflTje87+25QiAzcWV9ESF7l4e3gW2QTtX4s9n+LDqwPQBW
	O1F5xJh+0p/0GtOzbxSpPOEc4/BSZYxIZunwecXPNOmak11rOWKPi/9hF/QbFDklgHSe
	5+PCsJw3dEgxuyJBcAgq9Ugl6Qfdw90xVVRbvTjYj3+HPZ5Po9RHkWvUCfLyhokJKPXp
	Fp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=m+7dw5hKmXsp338KtR2XOfjWsndpiMW08FHL45jw1UU=;
	b=fFsPFx5BYz6u6dGoNbIoh9RvGWkhvV98cgT8VMVFHpBu951ufscM8o1NVGmzeZkaGk
	7ErKxFc/cn3GLAujTyQMs/M1nyXVptOQPVZkiyF0oiMciYD/qDzm9ZX07zVUfliKS4fb
	FMZbb7Q55y78mgqiHpvG+IMjSRr7J/WqB+5vqv7TGZImnkS2Ul8+RmoXiFyhw6PcH8VT
	J3aJHfje40vn507ElG6j9TTUJe/JvDS8qegnAo4uxQStxaFwqzCYM4HTfTIbpluKv720
	xgbeD334Q+sSAqUwX/mKwlLTX9kAAiwKtZHkx/VjWuqhtha50XtDoChWC+PRVGbksuer
	fvbw==
X-Gm-Message-State: AMke39mjG1huUaVSrzzF9J40GIoSN2u5JKH+1h2Wk1wK26NSBk8hMhJY8J9O+LP8+VvZYg==
X-Received: by 10.84.140.36 with SMTP id 33mr45779226pls.136.1489388968079;
	Mon, 13 Mar 2017 00:09:28 -0700 (PDT)
Received: from [10.162.103.9] ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	m6sm31282611pfg.126.2017.03.13.00.09.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Mar 2017 00:09:27 -0700 (PDT)
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <53aa1073-01e3-8315-cac6-ad0197a2d6c8@gmail.com>
Date: Mon, 13 Mar 2017 00:09:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
Subject: devshell not working after pulling latest oe-core changes
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
X-List-Received-Date: Mon, 13 Mar 2017 07:09:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,


I am seeing the following error with devshell after pulling in the 
latest master ( a47e64d985a610535449730806651f5bfd75d9ec) ? Running on 
"Ubuntu 16.04.2 LTS

ERROR: bind-9.10.3-P3-r0 do_devshell: No valid terminal found, unable to 
open devshell.
Tried the following commands:
     tmux split-window "do_terminal"
     tmux new-window -n "OpenEmbedded Developer Shell" "do_terminal"
     terminology -T="OpenEmbedded Developer Shell" -e do_terminal
     gnome-terminal -t "OpenEmbedded Developer Shell" -x do_terminal
     mate-terminal -t "OpenEmbedded Developer Shell" -x do_terminal
     konsole --separate --workdir . -p tabtitle="OpenEmbedded Developer 
Shell" -e do_terminal
     xfce4-terminal -T "OpenEmbedded Developer Shell" -e "do_terminal"
     xterm -T "OpenEmbedded Developer Shell" -e do_terminal
     rxvt -T "OpenEmbedded Developer Shell" -e do_terminal
     tmux new -d -s devshell -n devshell "do_terminal"
     screen -D -m -t "OpenEmbedded Developer Shell" -S devshell do_terminal
ERROR: bind-9.10.3-P3-r0 do_devshell: Function failed: do_devshell
ERROR: Logfile of failure stored in: 
/home/akuster/oss/maint/openembedded-core/build/tmp-glibc/work/aarch64-oe-linux/bind/9.10.3-P3-r0/temp/log.do_devshell.6445
ERROR: Task 
(/home/akuster/oss/maint/openembedded-core/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb:do_devshell) 
failed with exit code '1'


if I remove fa764a403da34bb0ca9fa3767a9e9dba8d685965 , devshell starts 
working again.

commit fa764a403da34bb0ca9fa3767a9e9dba8d685965
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Thu Mar 9 00:14:38 2017 +0000

     base/bitbake.conf: Filter contents of PATH to only allow 
whitelisted tools

is there something I am missing?

regards,

Armin



