Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>)
	id 1T2J3q-0007rD-0L; Fri, 17 Aug 2012 11:41:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7H9TjLS014663
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 17 Aug 2012 02:29:45 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 17 Aug 2012 02:29:44 -0700
Message-ID: <502E0F07.3010301@windriver.com>
Date: Fri, 17 Aug 2012 17:29:43 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <20120815133202.50B6D10218@opal>
	<20120816103308.GA32088@jama.jama.net>
	<20120816124239.GC32088@jama.jama.net>
	<1B858668EC6A94408DCA5225FDFA85AA576F7B28@ALA-MBA.corp.ad.wrs.com>
	<20120816143559.GD32088@jama.jama.net>
	<1B858668EC6A94408DCA5225FDFA85AA576F7B6D@ALA-MBA.corp.ad.wrs.com>
	<20120816220251.GC3625@jama.jama.net>
	<502DA2D4.7030302@windriver.com>
	<CAJTo0LYrwzMNkdZ6RsS-ku5Q001jCUNB5rie8=+g5-rNh9ARbQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYrwzMNkdZ6RsS-ku5Q001jCUNB5rie8=+g5-rNh9ARbQ@mail.gmail.com>
Cc: "Zhao, Zhenfeng" <Zhenfeng.Zhao@windriver.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Jackie Huang : gdk-pixbuf: fix the postinstall script failure when no icon is installed
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
X-List-Received-Date: Fri, 17 Aug 2012 09:41:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 8/17/2012 3:21 PM, Burton, Ross wrote:
> On 17 August 2012 02:48, jhuang0 <jackie.huang@windriver.com> wrote:
>> Yeah, it would be better for the postinstall script, but for
>> xcursor-transparent-theme without index.theme file, is it still a problem?
>
> Running gtk-update-icon-cache doesn't make sense on themes without an
> index.theme, because without an index.theme there are not any icons to

I see, so themes without an index.theme is not an issue, postinstall 
script should handle this case, I will change to call 
gtk-update-icon-cache only for themes with index.theme just as Martin's 
suggestion.

Thanks,
Jackie

> cache (xcursor themes are different).  From the man page:
>
> "It expects to be given the path to a icon theme directory containing
> an index.theme, e.g.  /usr/share/icons/hicolor, and writes a
> icon-theme.cache containing cached information about the icons in the
> directory tree below the given directory."
>
> Use -t to gtk-update-icon-cache, or filter the list of directories to
> only include ones with index.theme files.  Either is appropriate.
>
> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745


