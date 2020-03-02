Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id 5280F60F06
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2020 12:40:35 +0000 (UTC)
Received: from [127.0.0.1] (port=58982 helo=cpanel7.indieserve.net)
	by cpanel7.indieserve.net with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>) id 1j8kN9-007u3C-Vb
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Mar 2020 07:40:36 -0500
Received: from [66.129.241.14] ([66.129.241.14]) by crashcourse.ca (Horde
	Framework) with HTTPS; Mon, 02 Mar 2020 07:40:35 -0500
Date: Mon, 02 Mar 2020 07:40:35 -0500
Message-ID: <20200302074035.Horde.5xguZSt_-_Yd241eE1Zo8Pb@crashcourse.ca>
From: rpjday@crashcourse.ca
To: openembedded-core@lists.openembedded.org
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id:
	rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: how to cleanly centralize a zillion BBCLASSEXTEND += "nativesdk" settings?
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
X-List-Received-Date: Mon, 02 Mar 2020 12:40:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline

layer i'm currently perusing has many, many bbappend files, of which
quite a number are nothing more than the single line:

   BBCLASSEXTEND += "nativesdk"

literally, at least a hundred append files are like that. so rather
than clutter up the layer with all those trivial .bbappend files,
can one cram all that into a single .conf file? as i read it, can i
do something like:

   BBCLASSEXTEND_append_pn-pkg1 = " nativesdk"
   BBCLASSEXTEND_append_pn-pkg2 = " nativesdk"
   ... and on and on ...

and toss all that into a distro.conf file or something?

   and even if that works, is it considered good coding style?

rday




