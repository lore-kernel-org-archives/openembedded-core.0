Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TtbBL-000857-Ds
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 10:45:47 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0B9UXkG028013
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2013 01:30:33 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Fri, 11 Jan 2013 01:30:31 -0800
Message-ID: <50EFDBCF.6030003@windriver.com>
Date: Fri, 11 Jan 2013 17:30:55 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1757330.jo1AhcIeyl@yiqingliang-pc>
In-Reply-To: <1757330.jo1AhcIeyl@yiqingliang-pc>
X-Originating-IP: [128.224.163.154]
Subject: Re: glib2.0 and dbus dependency
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
X-List-Received-Date: Fri, 11 Jan 2013 09:45:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/2013 02:31 AM, Yi Qingliang wrote:
> when compiling using 4 threads, I got following error.
> the glib2.0-native want find dbus header file.
> If I compiled dbus/dbus-natigve, and then compile glib2.0 OK.
>
> when grep glib2.0 bb files, I can't find dbus in dependency, why?
>
>
Hi,

What's the error message?

Cheers,
Chen Qi

>
>   
> ERROR: Function failed: do_compile (see /mnt/src/arm9plf-
> build/tmp/work/x86_64-linux/glib-2.0-native/1_2.34.3-
> r0/temp/log.do_compile.28193 for further information)
> ERROR: Task 1851 (virtual:native:/mnt/src/optimus/poky/meta/recipes-
> core/glib-2.0/glib-2.0_2.34.3.bb, do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 929 tasks of which 925 didn't need to be rerun
> and 1 failed.
> Waiting for 0 running tasks to finish:
>
> Summary: 1 task failed:
>    virtual:native:/mnt/src/optimus/poky/meta/recipes-
> core/glib-2.0/glib-2.0_2.34.3.bb, do_compile
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



