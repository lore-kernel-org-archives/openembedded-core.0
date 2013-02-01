Received: from mail.bmw-carit.de ([62.245.222.98] helo=linuxmail.bmw-carit.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas.bulwahn@oss.bmw-carit.de>) id 1U1DGq-0001h8-7G
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 10:51:17 +0100
Received: from [192.168.101.9] (afplatform.bmw-carit.intra [192.168.101.9])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 7290940037
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2013 09:55:20 +0100 (CET)
Message-ID: <510B8C52.4020700@oss.bmw-carit.de>
Date: Fri, 01 Feb 2013 10:35:14 +0100
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Two recipes with the same file name for the SRC_URI
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 09:51:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I ran into the following issue with bitbake:
I have two recipes, where the SRC_URI of both recipes have the same file 
name (but of course, different URLs), e.g. SRC_URI = 
"http://foo.com/src.tar.gz" and SRC_URI = "http://bar.com/src.tar.gz".

Now when I want to fetch both of them, bitbake does not download both of 
them because they have the same name, and it assumes the file is already 
downloaded if one of the files is downloaded.
Is there an option to set the local file name after downloading in the 
recipe? The OpenEmbedded Manual does not mention any.

Or is there another way to solve the problem? Using Google and searching 
through the manual did not help me.


Lukas



