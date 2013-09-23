Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5147861105
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 09:22:31 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1VO2Lg-0000kl-KY from Muhammad_Shakeel@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Sep 2013 02:22:32 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 23 Sep 2013 02:22:32 -0700
Received: from [137.202.157.119] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Mon, 23 Sep 2013 10:22:30 +0100
Message-ID: <524008B1.5050202@mentor.com>
Date: Mon, 23 Sep 2013 14:24:01 +0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1378176620-27415-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1378176620-27415-1-git-send-email-rongqing.li@windriver.com>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 23 Sep 2013 09:22:32.0045 (UTC)
	FILETIME=[6E6D19D0:01CEB83E]
Subject: Re: [PATCH] systemd: add ptest
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
X-List-Received-Date: Mon, 23 Sep 2013 09:22:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/03/2013 07:50 AM, rongqing.li@windriver.com wrote:
> +do_install_ptest () {
> +       install -d ${D}${PTEST_PATH}/test
> +       install -d ${D}${libdir}/udev/rules.d
> +       install ${B}/test/* ${D}${PTEST_PATH}/test
This patch is merged into master and I am trying to build systemd with 
ptest but I see error that ${B}/test/* doesn't exist (true). It works 
fine if I replace 'B' with 'S' where this directory is actually present.
Is someone else seeing this error or it is something wrong with my 
environment?
> +       install -m 0755  ${B}/test-udev ${D}${PTEST_PATH}/
> +       install -d ${D}${PTEST_PATH}/build-aux
> +       cp -rf ${B}/rules ${D}${PTEST_PATH}/
> +       cp ${B}/Makefile ${D}${PTEST_PATH}/
> +       cp ${B}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
Same error here and same solution works here.
> +       tar -C ${D}${PTEST_PATH}/test -xJf ${B}/test/sys.tar.xz
'S' for 'B' here as well.
> +       sed -i 's/"tree"/"ls"/' ${D}${PTEST_PATH}/test/udev-test.pl
> +}
> +
Thanks,
Shakeel

