Return-Path: <openembedded-core@emagii.com>
Received: from smtprelay-h22.telenor.se (smtprelay-h22.telenor.se
	[195.54.99.197])
	by mail.openembedded.org (Postfix) with ESMTP id A90BA6CB97
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 21:25:24 +0000 (UTC)
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id 1CDBAEAD2A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 23:25:25 +0200 (CEST)
X-SENDER-IP: [83.227.59.84]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: As8bAJFUYFJT4ztUPGdsb2JhbAANTYt0rw+IWQMBAQEBOIMZfTQCMhoNCAEBtUmTLJN+A5gGlSo
X-IronPort-AV: E=Sophos;i="4.93,517,1378850400"; d="scan'208";a="638472224"
Received: from c-543be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.199]) ([83.227.59.84])
	by ipb1.telenor.se with ESMTP; 17 Oct 2013 23:25:24 +0200
Message-ID: <526055C4.40807@emagii.com>
Date: Thu, 17 Oct 2013 23:25:24 +0200
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Installing files in the /home/xxx directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ulf@emagii.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Oct 2013 21:25:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Would like to install some files in under the "/home" directory.

A simplfied recipe looks like this:

do_install () {
     install -d ${D}/${base_dir}/home/root
     install    -m 0644    ${S}/my.conf ${D}/${base_dir}/home/root/my.conf
}

FILES_mypackage = "${base_dir}/home/root/* "

Have extended bitbake.conf
-----------------------------------------------------------------------------------------------------------------
+export base_dir = "${base_prefix}"
+export home_dir = "${base_prefix}/home"
-----------------------------------------------------------------------------------------------------------------


Still I get:
-----------------------------------------------------------------------------------------------------------------
WARNING: QA Issue: nodeserver: Files/directories were installed but not 
shipped
   /home
   /home/root
-----------------------------------------------------------------------------------------------------------------
What is wrong in above?

Any ideas on how to get files into "/home/xxx" ?

-- 
Best Regards
Ulf Samuelsson

