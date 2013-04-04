Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Konrad.Scherer@windriver.com>) id 1UNpr9-0002I9-A5
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 21:30:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r34F77ri014434
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Apr 2013 08:07:07 -0700 (PDT)
Received: from [128.224.146.207] (128.224.146.207) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 4 Apr 2013 08:07:08 -0700
Message-ID: <515D971B.1050607@windriver.com>
Date: Thu, 4 Apr 2013 11:07:07 -0400
From: Konrad Scherer <konrad.scherer@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1365011250-24355-1-git-send-email-mark.hatle@windriver.com>
	<CAJTo0LZ5a4oa7k-Mz7VbgAHaP8wvacV8vNBX_vDByvDUfeCVWw@mail.gmail.com>
In-Reply-To: <CAJTo0LZ5a4oa7k-Mz7VbgAHaP8wvacV8vNBX_vDByvDUfeCVWw@mail.gmail.com>
X-Originating-IP: [128.224.146.207]
Subject: Re: [PATCH] Enable additional kernel parameters for syslinux
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
X-List-Received-Date: Thu, 04 Apr 2013 19:30:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2013 01:48 PM, Burton, Ross wrote:
> On 3 April 2013 18:47, Mark Hatle <mark.hatle@windriver.com> wrote:
>> Add additional parameter 'SYSLINUX_KERNEL_ARGS' in order to allow
>> for specific kernel parameters to be set when using syslinux.
>
> Why would you use this and not APPEND? (or am I totally
> misunderstanding something?)

A few more lines of context would have helped. Here is the code just after the 
patch.

             if append:
                 cfgfile.write('APPEND ')

                 if initrd:
                     cfgfile.write('initrd=/initrd ')

                 cfgfile.write('LABEL=%s '% (label))

                 cfgfile.write('%s %s\n' % (append, btype[1]))
             else:
                 cfgfile.write('APPEND %s\n' % btype[1])

The extra kernel parameters are added to btype[1] and then written out as part 
of the APPEND field.

Does that make sense?

-- 
Konrad Scherer, Sr. Engineer, Linux Products Group, Wind River
direct 613-963-1342   fax 613-592-2283


