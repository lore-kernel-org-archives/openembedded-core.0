Return-Path: <peter@berginkonsult.se>
X-Greylist: delayed 962 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 26 Feb 2019 08:35:50 UTC
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
	(mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
	by mail.openembedded.org (Postfix) with ESMTP id CC01D7C899
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 08:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20140924;
	h=content-type:mime-version:date:message-id:to:subject:from:from;
	bh=9Zn2FAcsXP9SszQuC5sKbjaxshrwXyyRA9nEDUbcpxw=;
	b=n901zt8GF+8h3VdoztXnLdtH7SXFSwhWgWWEG+q6pdieznN/e+7EyRccDeAxcXO3S0M1HP36x2A/i
	SwX82ltBhL//nLh2WNllwhf/5Dd1g62Q+xkAMTgI7i56ea4g4ZKGRdJ1RIhHaaXSpq0fz8ZmykDzgU
	MiYQJRQC6xOG/HA4=
X-HalOne-Cookie: 738bf678ee253d2d5b7c2c2219b90bb42e87dbc7
X-HalOne-ID: 47d3b006-399f-11e9-a597-d0431ea8bb10
Received: from [192.168.149.52] (unknown [80.252.208.151])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 47d3b006-399f-11e9-a597-d0431ea8bb10;
	Tue, 26 Feb 2019 08:19:48 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <a1b8155e-20d6-485e-4880-8293f20820de@berginkonsult.se>
Date: Tue, 26 Feb 2019 09:19:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
Subject: gcc - internal compiler error: Segmentation failt
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
X-List-Received-Date: Tue, 26 Feb 2019 08:35:51 -0000
Content-Type: multipart/alternative;
	boundary="------------95AC671A31B3FCB8A6FD1387"
Content-Language: en-US

--------------95AC671A31B3FCB8A6FD1387
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I'm working with thud branch and have run into a bug in gcc. I would 
like help how to proceed with this.

Compiling the following C code gives Segmentation fault in gcc:

#include <stdio.h>
#include <string.h>
#include <stdint.h>

int main(void)
{
     const int32_t BUFFER_MAX_LENGTH = 4096*1024;
     char buffer[BUFFER_MAX_LENGTH];

     if (strncmp(&buffer[8], "ABC", 3) == 0)
         return 1;

     return 0;
}


Error:

| during RTL pass: expand
| /work/yocto/metrum-r3/build/tmp/work/armv7at2hf-neon-poky-linux-gnueabi/compiler-test/1.0-r0/work/git/tmp/strncmp.c: In function 'main':
| /work/yocto/metrum-r3/build/tmp/work/armv7at2hf-neon-poky-linux-gnueabi/compiler-test/1.0-r0/work/git/tmp/strncmp.c:16:6: internal compiler error: Segmentation fault
|   if (strncmp(&buffer[8], "ABC", 3) == 0)
|       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| Please submit a full bug report,
| with preprocessed source if appropriate.


I would like this fixed in thud branch and took a quick look in gcc repo 
for solutions. I had no luck finding anything useful. Anyone seeing this 
before? Anyone having suggestion how to proceed? Shall I create a 
bugzilla in Yocto?

Thanks,
/Peter

--------------95AC671A31B3FCB8A6FD1387
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi,<br>
    <br>
    I'm working with thud branch and have run into a bug in gcc. I would
    like help how to proceed with this.<br>
    <br>
    Compiling the following C code gives Segmentation fault in gcc:<br>
    <br>
    <pre>#include &lt;stdio.h&gt;
#include &lt;string.h&gt;
#include &lt;stdint.h&gt;</pre>
    <pre>int main(void)
{
    const int32_t BUFFER_MAX_LENGTH = 4096*1024;
    char buffer[BUFFER_MAX_LENGTH];

    if (strncmp(&amp;buffer[8], "ABC", 3) == 0)
        return 1;

    return 0;
}</pre>
    <br>
    Error:<br>
    <br>
    <pre>| during RTL pass: expand
| /work/yocto/metrum-r3/build/tmp/work/armv7at2hf-neon-poky-linux-gnueabi/compiler-test/1.0-r0/work/git/tmp/strncmp.c: In function 'main':
| /work/yocto/metrum-r3/build/tmp/work/armv7at2hf-neon-poky-linux-gnueabi/compiler-test/1.0-r0/work/git/tmp/strncmp.c:16:6: internal compiler error: Segmentation fault
|   if (strncmp(&amp;buffer[8], "ABC", 3) == 0)
|       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| Please submit a full bug report,
| with preprocessed source if appropriate.</pre>
    <br>
    I would like this fixed in thud branch and took a quick look in gcc
    repo for solutions. I had no luck finding anything useful. Anyone
    seeing this before? Anyone having suggestion how to proceed? Shall I
    create a bugzilla in Yocto?<br>
    <br>
    Thanks,<br>
    /Peter<br>
  </body>
</html>

--------------95AC671A31B3FCB8A6FD1387--
