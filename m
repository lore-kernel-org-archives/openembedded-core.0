Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id CFEEE79C78
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2018 21:56:37 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id m19so4478264ioh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Dec 2018 13:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=6fe4OklNycsyYFDEufoob/ywWcOFF9JtBdoawFMM5WU=;
	b=ldwSKV/zcvfda0IOi8Exy3dwmNwopAqUXpqqSFFtpZSYuBx7pXBYelUDC70UapKR3b
	XBlwDPuOkdbCOeU0J5NFqg+zJhQkLVSRhGX+12bKkfijUgcePryrE4ygmlqZE+zwnsUk
	hU8MsjXjD44mIiuBjbnFqfxV44T/AmXB7D5okBtfpeaDhd1PYWW8rMmkwyF/O9BB+9vV
	6vTtMpc8sHxb9o8d8YF53JlwDuVM7KXQcaVp4OFFdrk6v9WzcANtDkZTMZQlPKpuscmB
	KcNNWH26vb1lpLEWINlEoDZGobbfQQZiY2TQaXlTW1Dy3J7bWlSKOcfDSwjiEvUbbd8n
	24+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=6fe4OklNycsyYFDEufoob/ywWcOFF9JtBdoawFMM5WU=;
	b=Xgt53iCLN0SJ8SE4m6Ezg1UpoXECoPHl0C/cKpUaG5rWSW1lEI8ZcypfSjjQLXG07s
	aRW0waj99QeM7yY2cuKYNSe8nwczYME0LvSAHpIPd4pCdiiys7jzvj58Jru5WaiJnZNv
	1/+vTRjPastZnARqDV2UUpRmzdZ8mDqWUrRE7CTU3kY4AudDn8UhLAmLYCA1GSD/wz+q
	FAHq/5rY9EjVy/HKcm7ucWH5K1AwsXP50dDvj08T33SykG9Pwo+X0qRplVkH5DVkz49n
	9cWL06yktGQucZ8eeY8lRMLvEnooLzNJ/GvXIkiDSd+UlUCWG7csFNa4bWHoQ/A9T6aW
	JJUA==
X-Gm-Message-State: AA+aEWbrjBMzpM7iG9rbY0DlmJsTEv9Rr+Mi4xj8xZQHR+9pC9v+6OTt
	zW9qMD5VCjv04WSZ3Vncg+XiV4rx
X-Google-Smtp-Source: AFSGD/WzgZDSOwCw5mgN8uKS0hfCbfPAkmapHevoLKyGJU8UljjMGNGhhybtQVIgSiDeWTD+rO07rA==
X-Received: by 2002:a6b:3bc8:: with SMTP id i191mr3222104ioa.23.1544219798285; 
	Fri, 07 Dec 2018 13:56:38 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	x21sm1768079iob.84.2018.12.07.13.56.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 07 Dec 2018 13:56:37 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <d715f1f3773906109da1b071937d5a6876d18b4a.camel@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 07 Dec 2018 15:56:36 -0600
In-Reply-To: <20181207215057.4140-1-JPEWhacker@gmail.com>
References: <20181207215057.4140-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
Subject: Re: [PATCH] persist_data: Retry database setup
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
X-List-Received-Date: Fri, 07 Dec 2018 21:56:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Oops, wrong list. I will resend to the bitbake list.

On Fri, 2018-12-07 at 15:50 -0600, Joshua Watt wrote:
> The configuration of the sqlite database can timeout due to locking
> under heavy load and should be subject to the same retry logic as the
> other statements.
> 
> [YOCTO #13069]
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  bitbake/lib/bb/persist_data.py | 85 ++++++++++++++++++------------
> ----
>  1 file changed, 45 insertions(+), 40 deletions(-)
> 
> diff --git a/bitbake/lib/bb/persist_data.py
> b/bitbake/lib/bb/persist_data.py
> index 29feb78203b..4b37227cfd1 100644
> --- a/bitbake/lib/bb/persist_data.py
> +++ b/bitbake/lib/bb/persist_data.py
> @@ -66,27 +66,31 @@ def _remove_table_weakref(ref):
>  class SQLTable(collections.MutableMapping):
>      class _Decorators(object):
>          @staticmethod
> -        def retry(f):
> +        def retry(*, reconnect=True):
>              """
>              Decorator that restarts a function if a database locked
> sqlite
> -            exception occurs.
> +            exception occurs. If reconnect is True, the database
> connection
> +            will be closed and reopened each time a failure occurs
>              """
> -            def wrap_func(self, *args, **kwargs):
> -                # Reconnect if necessary
> -                if self.connection is None:
> -                    self.reconnect()
> -
> -                count = 0
> -                while True:
> -                    try:
> -                        return f(self, *args, **kwargs)
> -                    except sqlite3.OperationalError as exc:
> -                        if 'is locked' in str(exc) and count < 500:
> -                            count = count + 1
> -                            self.reconnect()
> -                            continue
> -                        raise
> -            return wrap_func
> +            def retry_wrapper(f):
> +                def wrap_func(self, *args, **kwargs):
> +                    # Reconnect if necessary
> +                    if self.connection is None and reconnect:
> +                        self.reconnect()
> +
> +                    count = 0
> +                    while True:
> +                        try:
> +                            return f(self, *args, **kwargs)
> +                        except sqlite3.OperationalError as exc:
> +                            if 'is locked' in str(exc) and count <
> 500:
> +                                count = count + 1
> +                                if reconnect:
> +                                    self.reconnect()
> +                                continue
> +                            raise
> +                return wrap_func
> +            return retry_wrapper
>  
>          @staticmethod
>          def transaction(f):
> @@ -113,16 +117,28 @@ class SQLTable(collections.MutableMapping):
>      def __init__(self, cachefile, table):
>          self.cachefile = cachefile
>          self.table = table
> -        self.connection = connect(self.cachefile)
> -
> +        self.connection = None
>          self._execute_single("CREATE TABLE IF NOT EXISTS %s(key TEXT
> PRIMARY KEY NOT NULL, value TEXT);" % table)
>  
> +
> +    @_Decorators.retry(reconnect=False)
> +    @_Decorators.transaction
> +    def _setup_database(self, cursor):
> +        cursor.execute("pragma synchronous = off;")
> +        # Enable WAL and keep the autocheckpoint length small (the
> default is
> +        # usually 1000). Persistent caches are usually read-mostly,
> so keeping
> +        # this short will keep readers running quickly
> +        cursor.execute("pragma journal_mode = WAL;")
> +        cursor.execute("pragma wal_autocheckpoint = 100;")
> +
>      def reconnect(self):
>          if self.connection is not None:
>              self.connection.close()
> -        self.connection = connect(self.cachefile)
> +        self.connection = sqlite3.connect(self.cachefile, timeout=5)
> +        self.connection.text_factory = str
> +        self._setup_database()
>  
> -    @_Decorators.retry
> +    @_Decorators.retry()
>      @_Decorators.transaction
>      def _execute_single(self, cursor, *query):
>          """
> @@ -131,7 +147,7 @@ class SQLTable(collections.MutableMapping):
>          """
>          cursor.execute(*query)
>  
> -    @_Decorators.retry
> +    @_Decorators.retry()
>      def _row_iter(self, f, *query):
>          """
>          Helper function that returns a row iterator. Each time
> __next__ is
> @@ -173,7 +189,7 @@ class SQLTable(collections.MutableMapping):
>      def __exit__(self, *excinfo):
>          self.connection.__exit__(*excinfo)
>  
> -    @_Decorators.retry
> +    @_Decorators.retry()
>      @_Decorators.transaction
>      def __getitem__(self, cursor, key):
>          cursor.execute("SELECT * from %s where key=?;" % self.table,
> [key])
> @@ -182,14 +198,14 @@ class SQLTable(collections.MutableMapping):
>              return row[1]
>          raise KeyError(key)
>  
> -    @_Decorators.retry
> +    @_Decorators.retry()
>      @_Decorators.transaction
>      def __delitem__(self, cursor, key):
>          if key not in self:
>              raise KeyError(key)
>          cursor.execute("DELETE from %s where key=?;" % self.table,
> [key])
>  
> -    @_Decorators.retry
> +    @_Decorators.retry()
>      @_Decorators.transaction
>      def __setitem__(self, cursor, key, value):
>          if not isinstance(key, str):
> @@ -204,13 +220,13 @@ class SQLTable(collections.MutableMapping):
>          else:
>              cursor.execute("INSERT into %s(key, value) values (?,
> ?);" % self.table, [key, value])
>  
> -    @_Decorators.retry
> +    @_Decorators.retry()
>      @_Decorators.transaction
>      def __contains__(self, cursor, key):
>          cursor.execute('SELECT * from %s where key=?;' % self.table,
> [key])
>          return cursor.fetchone() is not None
>  
> -    @_Decorators.retry
> +    @_Decorators.retry()
>      @_Decorators.transaction
>      def __len__(self, cursor):
>          cursor.execute("SELECT COUNT(key) FROM %s;" % self.table)
> @@ -245,7 +261,7 @@ class SQLTable(collections.MutableMapping):
>          return self._row_iter(lambda row: (row[0], row[1]), "SELECT
> * FROM %s;" %
>                                self.table)
>  
> -    @_Decorators.retry
> +    @_Decorators.retry()
>      @_Decorators.transaction
>      def clear(self, cursor):
>          cursor.execute("DELETE FROM %s;" % self.table)
> @@ -302,17 +318,6 @@ class PersistData(object):
>          """
>          del self.data[domain][key]
>  
> -def connect(database):
> -    connection = sqlite3.connect(database, timeout=5)
> -    connection.execute("pragma synchronous = off;")
> -    # Enable WAL and keep the autocheckpoint length small (the
> default is
> -    # usually 1000). Persistent caches are usually read-mostly, so
> keeping
> -    # this short will keep readers running quickly
> -    connection.execute("pragma journal_mode = WAL;")
> -    connection.execute("pragma wal_autocheckpoint = 100;")
> -    connection.text_factory = str
> -    return connection
> -
>  def persist(domain, d):
>      """Convenience factory for SQLTable objects based upon
> metadata"""
>      import bb.utils
-- 
Joshua Watt <JPEWhacker@gmail.com>


