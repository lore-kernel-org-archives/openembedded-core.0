Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RBVdF-0004ar-4g
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 19:51:49 +0200
Received: from mail-ww0-f44.google.com ([74.125.82.44])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 05 Oct 2011 10:46:11 -0700
Received: by wwf22 with SMTP id 22so2039673wwf.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 10:46:09 -0700 (PDT)
Received: by 10.227.61.79 with SMTP id s15mr3345417wbh.96.1317836769451;
	Wed, 05 Oct 2011 10:46:09 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id fa3sm4192527wbb.3.2011.10.05.10.46.02
	(version=SSLv3 cipher=OTHER); Wed, 05 Oct 2011 10:46:05 -0700 (PDT)
Message-ID: <4E8C97D7.8020909@intel.com>
Date: Wed, 05 Oct 2011 10:45:59 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1316890497.git.sgw@linux.intel.com>
	<62e9da86a45eef3dd374bd8c7e110f619f620f80.1316890497.git.sgw@linux.intel.com>
	<1317742614.13337.47.camel@phil-desktop>
In-Reply-To: <1317742614.13337.47.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH 1/2] attr/acl: add SSTATEPOSTINSTFUNC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Oct 2011 17:51:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2011 08:36 AM, Phil Blundell wrote:
> On Sat, 2011-09-24 at 11:56 -0700, Saul Wold wrote:
>> +fix_symlink () {
>> +	# Remove bad symlinks&  create the correct symlinks
>> +	if test -L ${libdir}/lib${BPN}.so ; then
>> +		rm -rf ${libdir}/lib${BPN}.so
>> +		ln -sf ${base_libdir}/lib${BPN}.so ${libdir}/lib${BPN}.so
>> +	fi
>
> This breaks the build for me on micro.  I end up with a symlink pointing
> to itself:
>
> lrwxrwxrwx 1 pb pb 76 2011-10-04
> 16:09 /home/pb/oe/build-epia/build/tmp-eglibc/sysroots/x86_64-linux/lib/libattr.so ->  /home/pb/oe/build-epia/build/tmp-eglibc/sysroots/x86_64-linux/lib/libattr.so
>
> with predictably bad results.
>
Not good, I guess the change here would be to test if base_libdir and 
libdir are the same, would you confirm that this test would be right?

Thanks
	Sau!

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



