Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
	[209.85.210.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4EE0F7198F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 17:42:16 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id v10-v6so5362970otk.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 10:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=75Sw/qbY2E4r/oiQLnjDDUCcYfOxmBOXid7TdPALl1c=;
	b=Re3QJvNNlQN10l7x/0XAA1IlBxuZoi+xH9d5UpazPdeSHR4UUeuFKsHBJeitYcWfmc
	HaGaleNWSlD7pcu6McpUZ02TynYVJWUKluPcgtOP5+0bsIwdduXNyTYtoZwIeLBfyTpq
	dUOZ+B7Vt4TeJ9Gc+GG+vyI0m7zDXP05YTmDpggZztToQsXWR7o2r5mzsjzR1y7Aet8N
	wOT8mXo5gf8lArxhBRe7yYWCtlfwoEo8Wz7ZxvYaBiX16LLGoKy7ZKcptwug7KuOdflM
	AclyFYAK/w3BDPbgonyokeXVtOQhzUro2r/pUWVJNcXPUfdr+z9b3CMoJ49hnyNEv+kK
	C+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=75Sw/qbY2E4r/oiQLnjDDUCcYfOxmBOXid7TdPALl1c=;
	b=lA/lDYFus8E1+20YwtoBIyiGdcmtSaGEEAvw5BIRWLP6OfZ+jaTTzN4BS3OY0c0vGI
	Betv2aFOjk0isELPXmn69/a+xzfs30hX/uZL8JGi2o00QvuA3cr8jKMKQbx/ko/pcCrM
	Fe1QkOQwtxbI4JUh9hH2pzqfevys7Bgf9bf4mJxE96gQ0julRIdjPbTBePdnnsJtgdeH
	D2XGdtr+iXjwkRNYenLqgqAu0AahLYQ4TZRsarPGThHRYlMP463e3b6M23x0JF6Y/OAm
	PornNuBEB3IaIs0nQxyPfovTNlM6/CXOaZpxNPcgxuXCD3c0tu0sENsSiUNhQNhybjE+
	I80A==
X-Gm-Message-State: APzg51DFZGJPkYIhANIvE7gaN9gWjfjqaZbnLwZuX1f12em2JKn6xQBC
	mljkpk1T2JNssL7HEHwBIA0n6FcxkIBnj3+cY68=
X-Google-Smtp-Source: ANB0VdZwm44KQYbxTtiP1mHt9z3dSWyfeuruFQfMhBLQzZ8KcmERyM2X21XHY3BFIQ0DJzEqc8iur6rIYffP7LnKRLs=
X-Received: by 2002:a9d:3d4b:: with SMTP id
	a69-v6mr4948093otc.334.1536946937170; 
	Fri, 14 Sep 2018 10:42:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b48b:0:0:0:0:0 with HTTP; Fri, 14 Sep 2018 10:42:16
	-0700 (PDT)
In-Reply-To: <CALLMt=qKHqgQqS3TUsxdHngk8sVRTN6scWEyVYtxxiTzfbDPPA@mail.gmail.com>
References: <1536868179-5111-1-git-send-email-geissonator@gmail.com>
	<CAJTo0Lb8EDKyH16i5JcpyTQuLG1vPZaxes=B3hUM3=zn0_chsw@mail.gmail.com>
	<CAJTo0LZoPhfR4Ahd_CqXeouPfHoH8+zth_3qr6__rd2xCg2Y9A@mail.gmail.com>
	<d8c0d4fe-ae89-5b3d-0305-96820fd22141@xilinx.com>
	<CANNYZj9Mbpaf=gXupynTRvXiM1hPB4+pTsZ+0C+0fQVQkfomzg@mail.gmail.com>
	<CALLMt=qKHqgQqS3TUsxdHngk8sVRTN6scWEyVYtxxiTzfbDPPA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Sep 2018 19:42:16 +0200
Message-ID: <CANNYZj9FXbhTDZtc+xopvzpFYMCBt6ycNgXhBgp=tp-+d+pDBQ@mail.gmail.com>
To: Andrew Geissler <geissonator@gmail.com>
Cc: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python/python3: Move test files to test package
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
X-List-Received-Date: Fri, 14 Sep 2018 17:42:16 -0000
Content-Type: text/plain; charset="UTF-8"

2018-09-14 19:36 GMT+02:00 Andrew Geissler <geissonator@gmail.com>:
>> We should probably do another dig at ridding oe-core of py2 :)
>
> Uh-oh!  Guess we better get the Py3 update on our list.

I meant that oe-core will not depend on py2 for anything. The py2
recipe will be provided in oe-core for quite a while yet, but you
should keep in mind the official message from upstream:

"Being the last of the 2.x series, 2.7 will have an extended period of
maintenance. Specifically, 2.7 will receive bugfix support until
January 1, 2020. After the last release, 2.7 will receive no support."

Alex

