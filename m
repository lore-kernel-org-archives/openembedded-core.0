Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Tt0rQ-0004ru-FO
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 19:58:49 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r09IhWGG007721
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 9 Jan 2013 19:43:34 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Tt0ce-0005ug-GX; Wed, 09 Jan 2013 19:43:32 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <alpine.DEB.2.02.1301091312270.14396@oneiric>
	<50EDB793.7080202@linux.intel.com>
Date: Wed, 09 Jan 2013 19:43:32 +0100
In-Reply-To: <50EDB793.7080202@linux.intel.com> (Saul Wold's message of "Wed, 
	09 Jan 2013 10:31:47 -0800")
Message-ID: <ly38ya8aej.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Saul Wold <sgw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] local.conf.sample: Suggest parallelism of twice the number of cores.
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
X-List-Received-Date: Wed, 09 Jan 2013 18:58:49 -0000
Content-Type: text/plain

Saul Wold <sgw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:

>>   #PARALLEL_MAKE = "-j 4"
>>   #
>> -# For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
>> -# be appropriate for example.
>> -
>> +# If you have a multi-core machine, you would normally set both of these variables
>> +# to twice the number of cores.  So for a quad-core machine, it would be appropriate
>> +# to set BB_NUMBER_THREADS = "8" and PARALLEL_MAKE = "-j 8".
>
> I think adding a note to ensure that hyperthreading is enabled would
> be appropriate, then number of threads = number of hyperthreaded cores
> (4 vs 8).

what about a general

| BB_NUMBER_THREADS ??= "${@os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])}"

in bitbake.conf?  Or the sqrt() of it in in both PARALLEL_MAKE and
BB_NUMBER_THREADS...


Enrico


